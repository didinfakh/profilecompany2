<?php

namespace App\Console\Commands;

use Illuminate\Support\Str;
use InfyOm\Generator\Utils\TableFieldsGenerator;
use InfyOm\Generator\Generators\ModelGenerator as ModelGeneratorInfy;
use InfyOm\Generator\Generators\SwaggerGenerator;
use Mockery\Undefined;

class ViewGenerator extends ModelGeneratorInfy
{
    /**
     * Fields not included in the generator by default.
     */
    protected array $excluded_fields = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    private string $fileName;

    public function __construct()
    {
        parent::__construct();

        // $this->path = $this->config->paths->model;
        $this->path = 'D:/CLOUD/BITBUCKET/hk_rms_frontend';
        $this->fileName = $this->config->modelNames->name . '.php';
    }

    public function generate()
    {
        // $templateData = view('laravel-generator::model.model', $this->variables())->render();
        $viewName1 = 'page1';
        $viewName2 = 'page2';

        $templateData1 = view($viewName1, $this->variables())->render();
        $templateData2 = view($viewName2, $this->variables())->render();

        mkdir($this->path . '/src/app/(app)/' . $this->config->tableName);
        mkdir($this->path . "/src/app/(app)/" . $this->config->tableName . '/[...slug]');

        g_filesystem()->createFile($this->path . '/src/app/(app)/' . $this->config->tableName . '/page.js', $templateData1);
        g_filesystem()->createFile($this->path . "/src/app/(app)/" . $this->config->tableName . '/[...slug]' . '/page.js', $templateData2);

        $this->config->commandComment(infy_nl() . 'Model created: ');
        $this->config->commandInfo($this->fileName);
    }

    public function variables(): array
    {
        return [
            'fillables'        => implode(',' . infy_nl_tab(1, 2), $this->generateFillables()),
            'casts'            => implode(',' . infy_nl_tab(1, 2), $this->generateCasts()),
            'rules'            => implode(',' . infy_nl_tab(1, 2), $this->generateRules()),
            'swaggerDocs'      => $this->fillDocs(),
            'customPrimaryKey' => $this->customPrimaryKey(),
            'customCreatedAt'  => $this->customCreatedAt(),
            'customUpdatedAt'  => $this->customUpdatedAt(),
            'customSoftDelete' => $this->customSoftDelete(),
            'relations'        => $this->generateRelations(),
            'timestamps'       => config('laravel_generator.timestamps.enabled', true),
            'headersFrontend'  => implode('},' . infy_nl_tab(1, 2), $this->generateHeadersFrontend()) . "}",
            'rulesFrontend'  => $this->generateRulesFrontend(),
            'tbodyFrontend'  => $this->generateTbodyFrontend(),
            'recordsFrontend'  => $this->generateRecordsFrontend(),
            'bodyInsertFrontend'  => $this->generateBodyInsertFrontend(),
            'setRecordsFrontend'  => $this->generateSetRecordsFrontend(),
            'inputsFrontendL'  => $this->generateInputsFrontend('left'),
            'inputsFrontendR'  => $this->generateInputsFrontend('right'),
        ];
    }

    protected function customPrimaryKey()
    {
        // $primary = $this->config->getOption('primary');

        // if (!$primary) {
        //     return null;
        // }

        // if ($primary === 'id') {
        //     return null;
        // }


        $primary = 'id';
        foreach ($this->config->fields as $field) {
            if ($field->isPrimary)
                $primary = $field->name;
        }

        return $primary;
    }

    protected function customSoftDelete()
    {
        $deletedAt = config('laravel_generator.timestamps.deleted_at', 'deleted_at');

        if ($deletedAt === 'deleted_at') {
            return null;
        }

        return $deletedAt;
    }

    protected function customCreatedAt()
    {
        $createdAt = config('laravel_generator.timestamps.created_at', 'created_at');

        if ($createdAt === 'created_at') {
            return null;
        }

        return $createdAt;
    }

    protected function customUpdatedAt()
    {
        $updatedAt = config('laravel_generator.timestamps.updated_at', 'updated_at');

        if ($updatedAt === 'updated_at') {
            return null;
        }

        return $updatedAt;
    }

    protected function generateFillables(): array
    {
        $fillables = [];
        if (isset($this->config->fields) && !empty($this->config->fields)) {
            foreach ($this->config->fields as $field) {
                if ($field->isFillable) {
                    $fillables[] = "'" . $field->name . "'";
                }
            }
        }

        return $fillables;
    }

    protected function fillDocs(): string
    {
        if (!$this->config->options->swagger) {
            return '';
        }

        return $this->generateSwagger();
    }

    public function generateSwagger(): string
    {
        $requiredFields = $this->generateRequiredFields();

        $fieldTypes = SwaggerGenerator::generateTypes($this->config->fields);

        $properties = [];
        foreach ($fieldTypes as $fieldType) {
            $properties[] = view(
                'swagger-generator::model.property',
                $fieldType
            )->render();
        }

        $requiredFields = '{' . implode(',', $requiredFields) . '}';

        return view('swagger-generator::model.model', [
            'requiredFields' => $requiredFields,
            'properties'     => implode(',' . infy_nl() . ' ', $properties),
        ]);
    }

    protected function generateRequiredFields(): array
    {
        $requiredFields = [];

        if (isset($this->config->fields) && !empty($this->config->fields)) {
            foreach ($this->config->fields as $field) {
                if (!empty($field->validations)) {
                    if (Str::contains($field->validations, 'required')) {
                        $requiredFields[] = '"' . $field->name . '"';
                    }
                }
            }
        }

        return $requiredFields;
    }

    protected function generateRules(): array
    {
        $dont_require_fields = config('laravel_generator.options.hidden_fields', [])
            + config('laravel_generator.options.excluded_fields', $this->excluded_fields);

        $rules = [];

        foreach ($this->config->fields as $field) {

            if (!$field->isPrimary && !in_array($field->name, $dont_require_fields)) {
                if ($field->isNotNull && empty($field->validations)) {
                    $field->validations = 'required';
                }

                /**
                 * Generate some sane defaults based on the field type if we
                 * are generating from a database table.
                 */
                if ($this->config->getOption('fromTable')) {
                    $rule = empty($field->validations) ? [] : explode('|', $field->validations);

                    if (!$field->isNotNull) {
                        $rule[] = 'nullable';
                    }

                    switch ($field->dbType) {
                        case 'integer':
                            $rule[] = 'integer';
                            break;
                        case 'boolean':
                            $rule[] = 'boolean';
                            break;
                        case 'float':
                        case 'double':
                        case 'decimal':
                            $rule[] = 'numeric';
                            break;
                        case 'string':
                        case 'text':
                            $rule[] = 'string';

                            // Enforce a maximum string length if possible.
                            if ((int) $field->fieldDetails->getLength() > 0) {
                                $rule[] = 'max:' . $field->fieldDetails->getLength();
                            }
                            break;
                    }

                    $field->validations = implode('|', $rule);
                }
            }

            if (!empty($field->validations)) {
                if (Str::contains($field->validations, 'unique:')) {
                    $rule = explode('|', $field->validations);
                    // move unique rule to last
                    usort($rule, function ($record) {
                        return (Str::contains($record, 'unique:')) ? 1 : 0;
                    });
                    $field->validations = implode('|', $rule);
                }
                $rule = "'" . $field->name . "' => '" . $field->validations . "'";
                $rules[] = $rule;
            }
        }

        return $rules;
    }

    function escapeColumnName($col): bool
    {
        $column = array();
        $column["created_date"] = 1;
        $column["modified_date"] = 1;
        $column["created_by"] = 1;
        $column["modified_by"] = 1;
        $column["created_by_desc"] = 1;
        $column["modified_by_desc"] = 1;

        if (empty($column[$col])) {
            return false;
        }
        return true;
    }

    protected function generateRulesFrontend(): string
    {
        $dont_require_fields = config('laravel_generator.options.hidden_fields', [])
            + config('laravel_generator.options.excluded_fields', $this->excluded_fields);

        $str = "";
        $timestamps = TableFieldsGenerator::getTimestampFieldNames();
        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            // if (!$field->isPrimary && !in_array($field->name, $dont_require_fields)) {
            //     $is_required = "false";
            //     if ($field->isNotNull && empty($field->validations)) {
            //         $field->validations = 'required';
            //         $is_required = "true";
            //     }

            //     $str .= "".$field->name.": {";
            //     $str .= "label:'" .ucfirst($field->name). "',";
            //     $str .= "required:" . $is_required;
            //     $str .= "},";
            // }

            if (!empty($field->validations)) {
                $is_required = "false";
                if ($field->isNotNull && empty($field->validations)) {
                    $field->validations = 'required';
                    $is_required = "true";
                }
                $str .= "" . $field->name . ": {";
                $str .= "label:'" . ucfirst($field->name) . "',";
                $str .= "required:" . $is_required;
                $str .= "},\n";
            }
        }

        return $str;
    }

    protected function generateHeadersFrontend(): array
    {
        $casts = [];

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            $rule = "{";
            $rule .= "name: '" . $field->name . "',";
            $rule .= "label: '" . ucfirst($field->name) . "',";
            $rule .= "width: 'auto',";
            $rule .= "type: ";

            switch (strtolower($field->dbType)) {
                case 'integer':
                case 'increments':
                case 'smallinteger':
                case 'long':
                case 'biginteger':
                    $rule .= "'integer'";
                    break;
                case 'double':
                    $rule .= "'double'";
                    break;
                case 'decimal':
                    $rule .= sprintf("'decimal:%d'", $field->numberDecimalPoints);
                    break;
                case 'float':
                    $rule .= "'float'";
                    break;
                case 'boolean':
                    $rule .= "'boolean'";
                    break;
                case 'datetime':
                case 'datetimetz':
                    $rule .= "'datetime'";
                    break;
                case 'date':
                    $rule .= "'date'";
                    break;
                case 'enum':
                case 'string':
                case 'char':
                case 'text':
                    $rule .= "'string'";
                    break;
                default:
                    $rule = '';
                    break;
            }

            if (!empty($rule)) {
                $casts[] = $rule;
            }
            $rule .= "},";
        }

        return $casts;
    }

    public function generateUniqueRules(): string
    {
        $tableNameSingular = Str::singular($this->config->tableName);
        $uniqueRules = '';
        foreach ($this->generateRules() as $rule) {
            if (Str::contains($rule, 'unique:')) {
                $rule = explode('=>', $rule);
                $string = '$rules[' . trim($rule[0]) . '].","';

                $uniqueRules .= '$rules[' . trim($rule[0]) . '] = ' . $string . '.$this->route("' . $tableNameSingular . '");';
            }
        }

        return $uniqueRules;
    }

    public function generateCasts(): array
    {
        $casts = [];

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }

            $rule = "'" . $field->name . "' => ";

            switch (strtolower($field->dbType)) {
                case 'integer':
                case 'increments':
                case 'smallinteger':
                case 'long':
                case 'biginteger':
                    $rule .= "'integer'";
                    break;
                case 'double':
                    $rule .= "'double'";
                    break;
                case 'decimal':
                    $rule .= sprintf("'decimal:%d'", $field->numberDecimalPoints);
                    break;
                case 'float':
                    $rule .= "'float'";
                    break;
                case 'boolean':
                    $rule .= "'boolean'";
                    break;
                case 'datetime':
                case 'datetimetz':
                    $rule .= "'datetime'";
                    break;
                case 'date':
                    $rule .= "'date'";
                    break;
                case 'enum':
                case 'string':
                case 'char':
                case 'text':
                    $rule .= "'string'";
                    break;
                default:
                    $rule = '';
                    break;
            }

            if (!empty($rule)) {
                $casts[] = $rule;
            }
        }

        return $casts;
    }

    public function generateTbodyFrontend(): string
    {
        $casts = "";

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            $casts .= "<td className='border'>{m." . $field->name . "}</td>\n";
        }

        return $casts;
    }

    public function generateRecordsFrontend(): string
    {
        $casts = "";

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            $casts .= "const [" . $field->name . ", set" . $field->name . "] = useState('');\n";
        }

        return $casts;
    }

    public function generateBodyInsertFrontend(): string
    {
        $casts = "";

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            $casts .= $field->name . ",\n";
        }

        return $casts;
    }

    public function generateSetRecordsFrontend(): string
    {
        $casts = "";

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            $casts .= "set" . $field->name . "(response." . $field->name . ");\n";
        }

        return $casts;
    }

    public function generateInputsFrontend($align = null): string
    {
        // dd($this->config->fields);
        $casts = "";

        $timestamps = TableFieldsGenerator::getTimestampFieldNames();

        $is_genap = false;
        $count_input = 0;
        $fields = array();
        foreach ($this->config->fields as $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }
            $fields[] = $field;
            $count_input += 1;
        }
        if ($count_input % 2 === 0) {
            $is_genap = true;
        }
        if ($is_genap) {
            $count_left = $count_input / 2;
        } else {
            $count_left = round($count_input / 2);
        }

        foreach ($fields as $i => $field) {
            if (in_array($field->name, $timestamps)) {
                continue;
            }
            $colescape = $this->escapeColumnName($field->name);
            if ($colescape) {
                continue;
            }
            if (empty($field->validations)) {
                continue;
            }

            if ($align == "left" && $i < $count_left) {
                $casts .= "
                <Input
                ref={null}
                id='" . $field->name . "'
                type='" . $field->htmlType . "'
                label={rules." . $field->name . ".label}
                placeholder={rules." . $field->name . ".label}
                value={" . $field->name . "}
                className='block mt-1 w-full'
                onChange={event => set" . $field->name . "(event.target.value)}
                required={rules." . $field->name . ".required}
                autoFocus
                message_error={errors." . $field->name . "}
                onError={handleErrors}
                disabled={is_disabled}
            />
                \n";
            }
            if ($align == "right" && $i >= $count_left) {
                $casts .= "
                <Input
                ref={null}
                id='" . $field->name . "'
                type='" . $field->htmlType . "'
                label={rules." . $field->name . ".label}
                placeholder={rules." . $field->name . ".label}
                value={" . $field->name . "}
                className='block mt-1 w-full'
                onChange={event => set" . $field->name . "(event.target.value)}
                required={rules." . $field->name . ".required}
                autoFocus
                message_error={errors." . $field->name . "}
                onError={handleErrors}
                disabled={is_disabled}
            />
                \n";
            }
        }

        return $casts;
    }

    protected function generateRelations(): string
    {
        $relations = [];

        $count = 1;
        $fieldsArr = [];
        if (isset($this->config->relations) && !empty($this->config->relations)) {
            foreach ($this->config->relations as $relation) {
                $field = (isset($relation->inputs[0])) ? $relation->inputs[0] : null;

                $relationShipText = $field;
                if (in_array($field, $fieldsArr)) {
                    $relationShipText = $relationShipText . '_' . $count;
                    $count++;
                }

                $relationText = $relation->getRelationFunctionText($relationShipText);
                if (!empty($relationText)) {
                    $fieldsArr[] = $field;
                    $relations[] = $relationText;
                }
            }
        }

        return implode(infy_nl_tab(2), $relations);
    }

    public function rollback()
    {
        if ($this->rollbackFile($this->path, $this->fileName)) {
            $this->config->commandComment('Model file deleted: ' . $this->fileName);
        }
    }
}

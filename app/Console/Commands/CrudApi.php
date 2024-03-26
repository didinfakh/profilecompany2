<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Str;

class CrudApi extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:crud-api';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';


    /**
     * the Command's Arguments
     *
     * @var array
     */
    protected $arguments = [];

    /**
     * the Command's Options
     *
     * @var array
     */
    protected $options = [];

    private $db;
    private $routes = [];
    private $numericType = ['int', 'tinyint', 'mediumint', 'bigint'];
    private $decimalType = ['decimal', 'float', 'double'];
    private $dateType = ['date'];
    private $timeType = ['timestamp without time zone'];

    /**
     * Generate api
     *
     * @param array $params
     */
    public function handle()
    {
        $table = $this->ask('Type your name table to generate (table_name / all)?');
        $listTables = [];
        if ($table != 'all') {
            array_push($listTables, $table);
        } else {
            $this->info('Please wait, reading data from database .....');
            $listTables = $this->listTable();
        }

        foreach ($listTables as $t) {
            $this->info('Table name ' . $t . ' found');
            $this->generateApi($t);
        }

        if (!empty($this->routes)) {
            $this->info('Add below route to app/Config/Routes.php');
            foreach ($this->routes as $route) {
                $this->info($route);
            }
        }
    }

    private function listTable(): array
    {
        return $this->db->listTables();
    }

    public function listTableUI(): array
    {
        return $this->db->listTables();
    }

    public function runUI(array $listTables)
    {

        foreach ($listTables as $t) {
            $this->echoUI('Table name ' . $t . ' found');
            $this->generateApi($t);
        }

        if (!empty($this->routes)) {
            $this->echoUI('Add below route to app/Config/Routes.php');
            foreach ($this->routes as $route) {
                $this->echoUI($route);
            }
        }
    }

    private function echoUI($str)
    {
        echo $str . "\n";
    }

    private function generateApi(String $tableName)
    {
        $modelName = $this->getModelName($tableName);
        $entityName = $this->getEntityName($tableName);
        $controllerName = $this->getControllerName($tableName);
        $fields = $this->db->getFieldData($tableName);
        $primaryKey = '';
        $allowFields = [];
        $validationRules = [];
        $docPropertySchema = [];
        foreach ($fields as $field) {
            $validation = [];
            if (in_array($field->type, $this->numericType)) {
                // array_push($validation, 'numeric');
            }
            if (in_array($field->type, $this->decimalType)) {
                // array_push($validation, 'decimal');
            }
            if (in_array($field->type, $this->dateType)) {
                array_push($validation, 'date');
            }
            if ($field->max_length) {
                array_push($validation, 'max_length[' . $field->max_length . ']');
            }
            if (!@$field->nullable) {
                array_push($validation, 'required');
            }
            if (@$field->primary_key) {
                $primaryKey = $field->name;
                array_push($validation, 'is_unique[' . $tableName . '.' . $field->name . ',id,{id}]');
            } else {
                array_push($allowFields, $field->name);
            }
            if (!empty($validation) && !@$field->primary_key) {
                array_push($validationRules, "'" . $field->name . "' => '" . implode('|', $validation) . "'");
            }


            array_push($docPropertySchema, $this->generateDocProperty($field));
        }
        $docPropertySchemaStr = $this->swaggerSchemaDoc($modelName, $docPropertySchema);
        $dataSource = [
            'tableName' => $tableName,
            'entityName' => $entityName,
            'modelName' => $modelName,
            'controllerName' => $controllerName,
            'primaryKey' => $primaryKey,
            'allowFields' => "'" . implode("'," . PHP_EOL . "		'", $allowFields) . "'",
            'validationRules' => implode(',' . PHP_EOL . '		', $validationRules),
            'docPropertySchema' => $docPropertySchemaStr
        ];
        $this->createEntity($dataSource);
        $this->createModel($dataSource);
        $this->createController($dataSource);
        $this->appendRoute($tableName, $controllerName);
    }

    private function getModelName($tableName): String
    {
        return Str::studly($tableName);
    }

    private function getEntityName($tableName): String
    {
        return Str::studly($tableName);
    }

    private function getControllerName($tableName): String
    {
        return Str::studly(Str::plural($tableName));
    }

    private function replaceTemplate($stub, $search, $replace)
    {
        $stub = str_replace(
            $search,
            $replace,
            $stub
        );
        return $stub;
    }

    private function createModel(array $dataSource)
    {
        $this->info('Generate model ' . $dataSource['modelName']);
        $template = file_get_contents(__DIR__ . '/template/model.stub');
        $replaceData = [
            'modelName' => $dataSource['modelName'],
            'tableName' => $dataSource['tableName'],
            'entityName' => $dataSource['entityName'],
            'primaryKey' => $dataSource['primaryKey'],
            'allowFields' => $dataSource['allowFields'],
            'validationRules' => $dataSource['validationRules']
        ];
        $dataFile = $this->replaceTemplate($template, ['{{modelName}}', '{{tableName}}', '{{entityName}}', '{{primaryKey}}', '{{allowFields}}', '{{validationRules}}'], $replaceData);
        $path = APPPATH . '/Models/' . $dataSource['modelName'] . '.php';
        if (!write_file($path, $dataFile)) {
            CLI::error('Generate model failed, set your folder writable ' . $path);
            return;
        }
    }

    private function createEntity(array $dataSource)
    {
        $this->info('Generate entity ' . $dataSource['entityName']);
        $template = file_get_contents(__DIR__ . '/template/entity.stub');
        $replaceData = [
            'entityName' => $dataSource['entityName'],
            'swaggerDoc' => $dataSource['docPropertySchema']
        ];
        $dataFile = $this->replaceTemplate($template, ['{{entityName}}', '{{swaggerDoc}}'], $replaceData);
        $path = APPPATH . '/Entities/' . $dataSource['entityName'] . '.php';
        if (!write_file($path, $dataFile)) {
            CLI::error('Generate entity failed, set your folder writable ' . $path);
            return;
        }
    }

    private function createController(array $dataSource)
    {
        $this->info('Generate controller ' . $dataSource['controllerName']);
        $template = file_get_contents(__DIR__ . '/template/controller.stub');
        $replaceData = [
            'controllerName' => $dataSource['controllerName'],
            'modelName' => $dataSource['modelName'],
            'tag' => $dataSource['entityName'],
            'routeName' => lcfirst($dataSource['controllerName'])
        ];
        $dataFile = $this->replaceTemplate($template, ['{{controllerName}}', '{{modelName}}', '{{tag}}', '{{routeName}}'], $replaceData);
        $path = APPPATH . '/Controllers/' . $dataSource['controllerName'] . '.php';
        if (!write_file($path, $dataFile)) {
            CLI::error('Generate controller failed, set your folder writable ' . $path);
            return;
        }
    }

    private function appendRoute(String $tableName, String $controllerName)
    {
        array_push($this->routes, '$routes->resource(\'' . $tableName . '\', [\'controller\' =>\'' . $controllerName . '\']);');
    }

    private function generateDocProperty($field)
    {

        $type = 'string';
        $format = 'string';
        if (in_array($field->type, $this->numericType)) {
            $type = 'integer';
            $format = 'integer';
        }
        if (in_array($field->type, $this->decimalType)) {
            $type = 'number';
            $format = 'float';
        }
        if (in_array($field->type, $this->dateType)) {
            $type = 'string';
            $format = 'yyyy-mm-dd';
        }
        if (in_array($field->type, $this->timeType)) {
            $type = 'string';
            $format = 'yyyy-mm-dd hh:ii:ss';
        }
        $head = '
	/**
	 * @OA\Property(		 		 		 
	 *     description="' . $field->name . '",
	 *     title="' . $field->name . '",
	 *     type="' . $type . '",
	 * 	   format="' . $format . '",	 
';
        $additional = [];

        array_push($additional, '	 * 	   nullable=' . (@$field->nullable ? 'true' : 'false') . ',');

        if ($field->max_length) {
            array_push($additional, '	 * 	   maxLength=' . $field->max_length . ',');
        }
        $foot = '
	 * )
	 *		 
	 */
';
        $fieldName = is_numeric($field->name) ? '_' . strval($field->name) : $field->name;
        $fieldName = preg_replace('/\s+/', '_', $fieldName);
        return $head . PHP_EOL . implode(PHP_EOL, $additional) . PHP_EOL . $foot . PHP_EOL . '	private $' . $fieldName . ';';
    }
    private function swaggerSchemaDoc($modelName, $docPropertySchema)
    {
        return implode(PHP_EOL, $docPropertySchema);
    }
}

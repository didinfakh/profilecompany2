<?php

namespace App\Console\Commands;

use InfyOm\Generator\Commands\APIScaffoldGeneratorCommand;
use Illuminate\Support\Str;
use Illuminate\Filesystem\Filesystem;
use InfyOm\Generator\Common\GeneratorConfig;

class CrudApi extends APIScaffoldGeneratorCommand
{
    protected $name = 'app:crud-api';

    public function handle()
    {
        $this->config = app(GeneratorConfig::class);
        $this->config->setCommand($this);

        $this->config->init();
        $this->getFields();
        $this->config->modelNames->name = Str::studly($this->config->tableName);

        $this->fireFileCreatingEvent('api_scaffold');

        $this->generateCommonItems();

        $this->generateAPIItems();

        $this->generateScaffoldItems();

        $this->performPostActionsWithMigration();
        $this->fireFileCreatedEvent('api_scaffold');
    }

    public function generateCommonItems()
    {

        if (!$this->isSkip('model')) {
            $modelGenerator = app(ModelGenerator::class);
            $modelGenerator->generate();
        }
    }

    public function generateAPIItems()
    {
        if (!$this->isSkip('controllers') and !$this->isSkip('api_controller')) {
            $controllerGenerator = app(APIControllerGenerator::class);
            $controllerGenerator->generate();
        }

        if (!$this->isSkip('routes') and !$this->isSkip('api_routes')) {
            $routesGenerator = app(APIRoutesGenerator::class);
            $routesGenerator->generate();
        }
        // if (!$this->isSkip('routes') and !$this->isSkip('api_routes')) {
        $routesGenerator = app(ViewGenerator::class);
        $routesGenerator->generate();
        // }
    }

    public function generateScaffoldItems()
    {
    }

    // protected function getArguments()
    // {
    //     return array_merge(parent::getArguments(), ["model" => Str::studly($this->option("table"))]);
    // }
}

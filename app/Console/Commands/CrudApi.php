<?php

namespace App\Console\Commands;

use InfyOm\Generator\Commands\APIScaffoldGeneratorCommand;
use Illuminate\Support\Str;
use Illuminate\Filesystem\Filesystem;

class CrudApi extends APIScaffoldGeneratorCommand
{
    protected $name = 'app:crud-api';


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
}

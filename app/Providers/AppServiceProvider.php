<?php

namespace App\Providers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    function getSqlWithBindings($query)
    {
        return vsprintf(str_replace('?', '%s', $query->sql), collect($query->bindings)->map(function ($binding) {
            return is_numeric($binding) ? ($binding === null ? 'null' : $binding) : "'{$binding}'";
        })->toArray());
    }

    public function boot(): void
    {
        // Log sql to artisan
        DB::listen(function ($query) {
            $sql = $this->getSqlWithBindings($query);
            if (strstr($sql, 'sessions') === false) {
                $time = $query->time;
                file_put_contents('php://stdout', "[SQL]" . date("Y-m-d H:i:s") . " {$sql} \n" .
                    //   "      bindings:\t".json_encode($bindings)."\n".
                    "      Time:\t{$time} milliseconds\n");
            }
        });
    }
}

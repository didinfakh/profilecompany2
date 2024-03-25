<?php

namespace App\Providers;

use App\Models\SysPersonalAccessToken;
use App\Models\SysUser;
use App\Policies\SysUserPolicy;
use App\Sessions\DatabaseSessionHandler;
use App\Sessions\SessionGuard;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\ServiceProvider;
use Laravel\Sanctum\Sanctum;
use Illuminate\Support\Facades\Auth;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }


    function getSqlWithBindings($query)
    {
        return vsprintf(str_replace('?', '%s', $query->sql), collect($query->bindings)->map(function ($binding) {
            return $binding === null ? 'null' : (is_numeric($binding) ?  $binding : "'{$binding}'");
        })->toArray());
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Gate::policy(SysUser::class, SysUserPolicy::class);

        //custom
        Sanctum::usePersonalAccessTokenModel(SysPersonalAccessToken::class);

        // Auth::extend('session', function (Application $app) {
        //     return new SessionGuard();
        // });

        Session::extend('database', function (Application $app) {
            $table = $app->config->get('session.table');
            $lifetime = $app->config->get('session.lifetime');
            $connection = $app->config->get('session.connection');

            return new DatabaseSessionHandler(
                $app->make('db')->connection($connection),
                $table,
                $lifetime,
                $app
            );
        });

        ResetPassword::createUrlUsing(function (object $notifiable, string $token) {
            return config('app.frontend_url') . "/password-reset/$token?email={$notifiable->getEmailForPasswordReset()}";
        });

        // Log sql to artisan
        // DB::listen(function ($query) {
        // $sql = $this->getSqlWithBindings($query);
        // if (strstr($sql, 'sys_session') === false) {
        // $time = $query->time;
        // file_put_contents('php://stdout', "[SQL]" . date("Y-m-d H:i:s") . " {$sql} \n" .
        //   "      bindings:\t".json_encode($bindings)."\n".
        // "      Time:\t{$time} milliseconds\n");
        // }
        // });
    }
}

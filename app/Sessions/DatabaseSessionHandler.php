<?php

namespace App\Sessions;

use Illuminate\Session\DatabaseSessionHandler as SessionDatabaseSessionHandler;
use Illuminate\Contracts\Auth\Guard;

class DatabaseSessionHandler extends SessionDatabaseSessionHandler
{
    protected function addUserInformation(&$payload)
    {
        if ($this->container->bound(Guard::class)) {
            $payload['id_user'] = 100;
            // if ($payload['id_user']) {
            //     var_dump($this->userId());
            //     die();
            // }
        }

        return $this;
    }
}

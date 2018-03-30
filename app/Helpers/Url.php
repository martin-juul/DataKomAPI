<?php

namespace App\Helpers;

use Slim\Http\Request;

class Url
{
    public static function getReferer(Request $request)
    {
        $uri = $request->getUri();
        $port = $uri->getPort();
        $serverPort = '';

        if ($port != '80' || $port != '443') {
            $serverPort = ':'.$port;
        }

        return $uri->getScheme() . '://' . $uri->getHost() . $serverPort . $uri->getPath();
    }
}
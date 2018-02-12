<?php
return [
    'settings' => [
        'displayErrorDetails' => true, // Set to false in prod!
        'addContentLengthHeader' => false, // Let the web server calculate the content length header

        'db' => [
            'driver' => 'mysql',
            'host' => 'localhost',
            'database' => 'datakom',
            'username' => 'datakom_usr',
            'password' => '28At1PP6tNDdBvb46X7ww6Guvpc',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ],
    ]
];
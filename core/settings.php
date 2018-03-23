<?php
return [
    'app' => [
        'url' => 'datakom.test',
        'password' => [
            'hash' => [
                'algo' => PASSWORD_BCRYPT,
                'cost' => 10
            ],
        ],
    ],
    'settings' => [
        'displayErrorDetails' => true, // Set to false in prod!
        'addContentLengthHeader' => false, // Let the web server calculate the content length header

        'db' => [
            'driver' => 'mysql',
            'host' => 'localhost:4306',
            'database' => 'datakom',
            'username' => 'root',
            'password' => 'Raj6cNj7vRXNNW7zwuJ6Fe36nFv',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ],
        'db_dev' => [
            'driver' => 'mysql',
            'host' => 'localhost:4306',
            'database' => 'datakom',
            'username' => 'root',
            'password' => 'Raj6cNj7vRXNNW7zwuJ6Fe36nFv',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ],

        'templates' => __DIR__ . '/../templates',
    ]
];
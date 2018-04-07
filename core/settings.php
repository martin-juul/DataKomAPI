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
        'session' => [
            'name' => 'DataKomUid'
        ],
    ],
    'settings' => [
        'displayErrorDetails' => true, // Set to false in prod!
        'addContentLengthHeader' => false, // Let the web server calculate the content length header

        'db' => [
            'driver' => 'mysql',
            'host' => 'backend-db',
            'database' => 'DataKom',
            'username' => 'DataKom',
            'password' => 'Raj6cNj7vRXNNW7zwuJ6Fe36nFv',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ],

        'templates' => __DIR__ . '/../templates',
    ]
];

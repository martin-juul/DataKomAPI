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
            'password' => 'nRERwJJDU1sqACCk5ok5jHDZ90p',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ],
        'db_dev' => [
            'driver' => 'mysql',
            'host' => 'localhost',
            'database' => 'datakom',
            'username' => 'datakom_devusr',
            'password' => 'nRERwJJDU1sqACCk5ok5jHDZ90p',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_danish_ci',
            'prefix' => 'dk_'
        ]
    ]
];
<?php

if (PHP_SAPI == 'cli-server') {
    // To help the built-in PHP dev server, check if the request was actually for
    // something which should probably be served as a static file
    $url  = parse_url($_SERVER['REQUEST_URI']);
    $file = __DIR__ . $url['path'];
    if (is_file($file)) {
        return false;
    }
}
require __DIR__ . '/../vendor/autoload.php';
$settings = require __DIR__ .'/../core/settings.php';

session_start([
    'name' => $settings['app']['session']['name']
]);

$app = new \Slim\App($settings);

require __DIR__ . '/../core/dependencies.php';
require __DIR__ . '/../core/middleware.php';

// CMS routes MUST be required before API routes, due to the catch-all
require __DIR__ . '/../routes/cms.php';
require __DIR__ . '/../routes/api.php';

try {
    $app->run();
} catch (\Slim\Exception\MethodNotAllowedException $e) {
} catch (\Slim\Exception\NotFoundException $e) {
} catch (Exception $e) {
}
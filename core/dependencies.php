<?php

// Pimple service locator configuration

$container = $app->getContainer();

// Eloquent - ORM
$capsule = new \Illuminate\Database\Capsule\Manager;
$capsule->addConnection($container['settings']['db']);
$capsule->setAsGlobal();
$capsule->bootEloquent();

/**
 * @return \Illuminate\Database\Capsule\Manager
 */
$container['db'] = function ($c) use ($capsule) {
    return $capsule;
};

// Twig

$container['view'] = function ($c) {
    $twig = new \Slim\Views\Twig($c['settings']['templates'], [
        'cache' => false,
        'debug' => true,
    ]);

    // Instantiate and add Slim specific extension
    $basePath = rtrim(str_ireplace('index.php', '', $c['request']->getUri()->getBasePath()), '/');
    $twig->addExtension(new Slim\Views\TwigExtension($c['router'], $basePath));
    $twig->addExtension(new \App\Extensions\Twig\CsrfExtension($c['csrf']));
    $twig->addExtension(new Twig_Extension_Debug());

    return $twig;
};

// Slim CSRF
$container['csrf'] = function($container) {
    return new \Slim\Csrf\Guard;
};

// Repositories

$container['cardsRepository'] = function ($c) {
    return new App\Repositories\CardsRepository;
};

$container['courseRepository'] = function ($c) {
    return new App\Repositories\CourseRepository;
};

$container['contentRepository'] = function ($c) {
    return new App\Repositories\ContentRepository;
};

$container['educationRepository'] = function ($c) {
    return new App\Repositories\EducationRepository;
};

$container['semesterRepository'] = function ($c) {
    return new App\Repositories\SemesterRepository;
};

$container['studentTypeRepository'] = function ($c) {
    return new App\Repositories\StudentTypeRepository;
};
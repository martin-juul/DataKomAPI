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
        'cache' => __DIR__ . '/../cache/twig',
        'debug' => true,
    ]);

    // Instantiate and add Slim specific extension
    $basePath = rtrim(str_ireplace('index.php', '', $c['request']->getUri()->getBasePath()), '/');
    $twig->addExtension(new Slim\Views\TwigExtension($c['router'], $basePath));
    $twig->addExtension(new \App\Extensions\Twig\CsrfExtension($c['csrf']));
    $twig->addExtension(new \App\Extensions\Twig\EncodeDecodeExtension());
    $twig->addExtension(new Twig_Extension_Debug());
    $twig->addExtension(new \nochso\HtmlCompressTwig\Extension());

    // Globals
    $twig->getEnvironment()->addGlobal('currentUrl',$c->get('request')->getUri());

    return $twig;
};

// Slim CSRF
$container['csrf'] = function($container) {
    $guard =  new \Slim\Csrf\Guard;
    $guard->setPersistentTokenMode(true);
    return $guard;
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
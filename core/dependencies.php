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

// Slim CSRF
$container['csrf'] = function($c) {
    $guard =  new \Slim\Csrf\Guard;
    $guard->setPersistentTokenMode(true);
    return $guard;
};

// Auth
$container['auth'] = function($c) {
    return new \App\Auth\Auth;
};


// Twig

$container['view'] = function ($c) {
    $twig = new \Slim\Views\Twig($c['settings']['templates'], [
        'cache' => false, //__DIR__ . '/../cache/twig',
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
    $twig->getEnvironment()->addGlobal('auth', [
        'check' => $c->auth->isLoggedIn(),
        'user' => $c->auth->user(),
    ]);

    return $twig;
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
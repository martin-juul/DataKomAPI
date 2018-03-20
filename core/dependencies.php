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


EloquentFilter\LumenServiceProvider::class;

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
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

// Repositories

$container['courseRepository'] = function ($c) {
    return new App\Repositories\CourseRepository;
};

$container['educationRepository'] = function ($c) {
    return new App\Repositories\EducationRepository();
};

$container['studentTypeRepository'] = function ($c) {
    return new App\Repositories\StudentTypeRepository();
};
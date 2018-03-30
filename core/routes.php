<?php
// Routes

/** @var \Slim\App $app */
$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
        ->withHeader('Access-Control-Allow-Origin', 'http://localhost:4200')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->group('/v1', function () {

    $this->group('/cards', function () {
        $this->get('', \App\Controllers\CardsController::class . ':index')
            ->setName('allCards');
    });

    $this->group('/content', function () {
       $this->get('/cards', \App\Controllers\ContentController::class . ':cards')
           ->setName('allContentCards');

       $this->get('/{id}', \App\Controllers\ContentController::class . ':content')
           ->setName('contentById');
    });

    $this->group('/courses', function () {
        $this->get('', \App\Controllers\CourseController::class . 'index')
            ->setName('allCourses');

        $this->get('/{courseId}', \App\Controllers\CourseController::class . ':getByCourseId')
            ->setName('getCourseByCourseId');
    });

    $this->group('/educations', function () {
        $this->get('', \App\Controllers\EducationController::class . ':index')
            ->setName('allEdu');

        $this->get('/id/{courseId}', \App\Controllers\EducationController::class . ':getById')
            ->setName('getEduById');
    });

    $this->group('/studentTypes', function () {
        $this->get('', \App\Controllers\StudentTypeController::class . ':index')
            ->setName('studentTypes');

        $this->get('/list-groups', \App\Controllers\StudentTypeController::class . ':listGroups')
            ->setName('allStudentTypeGroups');

        $this->get('/groups', 'App\Controllers\StudentTypeController:assignedGroups')
            ->setName('studentTypesAssignedGroups');
    });

    $this->group('/semesters', function () {
        $this->get('/{groupId}/{eduId}', \App\Controllers\SemesterController::class . ':getByEduId')
            ->setName('semesterByGroupEduId');
    });

});

$app->group('/cms', function () {

    $this->get('', \App\Controllers\Cms\Dashboard::class .':index')->setName('adminHome');

    $this->get('/fag', 'App\Controllers\Cms\Dashboard:courses')->setName('adminCourseIndex');

    $this->get('/{routes:.+}', \App\Controllers\Cms\ErrorController::class .':NotFound')->setName('adminErrorNotFound');

})->add($app->getContainer()->get('csrf'));

$app->group('/', function () {

    $this->get('', function($request, $response) {
        return $response->write(file_get_contents(__DIR__ . '/../public/index.html'));
    });

    $this->get('{routes:.+}', function($request, $response) {
        return $response->write(file_get_contents(__DIR__ . '/../public/index.html'));
    });

});


// Catch-all route to serve a 404 Not Found page if none of the routes match
// NOTE: make sure this route is defined last
$app->map(['POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});
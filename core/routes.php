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
        $this->get('', 'App\Controllers\CardsController:index')->setName('allCards');
    });

    $this->group('/content', function () {
       $this->get('/cards', 'App\Controllers\ContentController:cards')->setName('allContentCards');
       $this->get('/{id}', 'App\Controllers\ContentController:content')->setName('contentById');
    });

    $this->group('/courses', function () {
        // $this->get('{id}', 'App\Controllers\CourseController:getById')->setName('getCourseById');
        $this->get('', 'App\Controllers\CourseController:index')->setName('allCourses');
        $this->get('/{courseId}', 'App\Controllers\CourseController:getByCourseId')->setName('getCourseByCourseId');
    });

    $this->group('/educations', function () {
        $this->get('', 'App\Controllers\EducationController:index')->setName('allEdu');
        $this->get('/{courseId}', 'App\Controllers\EducationController:getById')->setName('getEduById');
    });

    $this->group('/studentTypes', function () {
        $this->get('', 'App\Controllers\StudentTypeController:index')->setName('allStudentTypes');
        $this->get('/list-groups', 'App\Controllers\StudentTypeController:listGroups')->setName('allStudentTypeGroups');
        $this->get('/groups', 'App\Controllers\StudentTypeController:assignedGroups')->setName('studentTypesAssignedGroups');
    });

    $this->group('/semesters', function () {
        $this->get('/{groupId}/{eduId}', 'App\Controllers\SemesterController:getByEduId')->setName('semesterByGroupEduId');
    });

});

// Catch-all route to serve a 404 Not Found page if none of the routes match
// NOTE: make sure this route is defined last
$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});
<?php
// Routes

/** @var \Slim\App $app */
$app->group('/v1', function () {

    $this->group('/table', function () {

        $this->group('/semester', function () {
            $this->get('', 'App\Controllers\TableController:index')->setName('allSemesters');
        });

    });

    $this->group('/course', function () {
        // $this->get('{id}', 'App\Controllers\CourseController:getById')->setName('getCourseById');
        $this->get('s', 'App\Controllers\CourseController:index')->setName('allCourses');
        $this->get('/{courseId}', 'App\Controllers\CourseController:getByCourseId')->setName('getCourseByCourseId');
    });

    $this->group('/education', function () {
        $this->get('', 'App\Controllers\EducationController:index')->setName('allEdu');
        $this->get('/{courseId}', 'App\Controllers\EducationController:getById')->setName('getEduById');
    });

});
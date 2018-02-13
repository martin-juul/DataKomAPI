<?php
// Routes

/** @var \Slim\App $app */
$app->group('/v1', function () {

    $this->group('/table', function () {

        $this->group('/semester', function () {
            $this->get('', 'App\Controllers\TableController:index')->setName('allSemesters');
        });

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

});
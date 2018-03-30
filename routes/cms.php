<?php
/*
 * CMS Routes
 */

/** @var \Slim\App $app */
try {
    $app->group('/cms', function () {

        $this->get('', \App\Controllers\Cms\Dashboard::class . ':index')
            ->setName('adminHome');

        $this->group('/fag', function () {
            $this->get('', \App\Controllers\Cms\Dashboard::class . ':courses')
                ->setName('adminCourseIndex');

            $this->get('/rediger/{courseId}', \App\Controllers\Cms\Dashboard::class . ':courseEdit')
                ->setName('adminCourseEdit');
        });

        $this->group('/uddannelser', function () {
            $this->get('', \App\Controllers\Cms\Dashboard::class . ':educations')
                ->setName('adminEdu');

            /*$this->get(\App\Controllers\Cms\Dashboard::class . ':educationEdit')
                ->setName('adminEduEdit');*/
        });

        $this->group('/hovedforlob', function () {
            $this->get('', \App\Controllers\Cms\Dashboard::class . ':semesters')
                ->setName('adminSemesters');

            $this->get('/rediger/{eduId}/{groupId}', \App\Controllers\Cms\Dashboard::class . ':semesterEdit')
                ->setName('adminSemesterEdit');
        });

        $this->group('/data', function () {
           $this->get('/courses', \App\Controllers\Cms\Crud::class . ':getCourses')
            ->setName('adminCrudGetMissingCourses');

           $this->group('/semester', function () {
              $this->post('/course', \App\Controllers\Cms\Crud::class . ':assignCourseToSemester');
           });

        });

        // Catch all route for not found errors in the admin dashboard.
        $this->get('/{routes:.+}', \App\Controllers\Cms\ErrorController::class . ':NotFound')
            ->setName('adminErrorNotFound');

    })->add($app->getContainer()->get('csrf'));
} catch (\Psr\Container\NotFoundExceptionInterface $e) {
} catch (\Psr\Container\ContainerExceptionInterface $e) {
}
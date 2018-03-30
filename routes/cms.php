<?php
/*
 * CMS Routes
 */

/** @var \Slim\App $app */
try {
    $app->group('/cms', function () {

        $this->get('', \App\Controllers\Cms\Dashboard::class . ':index')
            ->setName('adminHome');

        $this->get('/fag', 'App\Controllers\Cms\Dashboard:courses')
            ->setName('adminCourseIndex');

        // Catch all route for not found errors in the admin dashboard.
        $this->get('/{routes:.+}', \App\Controllers\Cms\ErrorController::class . ':NotFound')
            ->setName('adminErrorNotFound');

    })->add($app->getContainer()->get('csrf'));
} catch (\Psr\Container\NotFoundExceptionInterface $e) {
} catch (\Psr\Container\ContainerExceptionInterface $e) {
}
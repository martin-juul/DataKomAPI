<?php
// Routes

$app->group('/v1', function () {

    $this->get('/table', 'App\Controllers\TableController:index')
         ->setName('table');

});
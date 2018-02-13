<?php

namespace App\Controllers;


use Psr\Container\ContainerInterface;

class StudentTypeController extends BaseController
{
    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
    }
}
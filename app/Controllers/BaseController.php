<?php

namespace App\Controllers;

use Psr\Container\ContainerInterface;

abstract class BaseController
{
    protected $c;

    /**
     * BaseController constructor.
     * @param ContainerInterface $c
     */
    public function __construct(ContainerInterface $c)
    {
        $this->c = $c;
    }

    public function __get($property)
    {
        if ($this->c->{$property}) {
            return $this->c->{$property};
        }
    }
}
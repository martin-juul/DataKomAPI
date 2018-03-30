<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class AuthController extends BaseController
{
    /** @var \Slim\Csrf\Guard */
    private $csrf;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->csrf = $c->get('csrf');
    }

    public function logIn(Request $request, Response $response)
    {

    }

    public function signUp(Request $request, Response $response)
    {
    }
}
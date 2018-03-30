<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class ErrorController extends BaseController
{
    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
    }

    public function NotFound(Request $request, Response $response)
    {
        $message = [
            'title' => 'Siden kunne ikke findes.',
            'body' => 'Vi kunne desværre ikke finde den side du ledte efter.'
        ];

        $this->c->view->render($response->withStatus(404), 'cms/error/notfound.twig', $message);

        return $response;
    }
}
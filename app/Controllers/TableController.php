<?php
namespace App\Controllers;

use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class TableController extends BaseController
{
    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
    }

    public function index(Request $request, Response $response)
    {
        $table = $request->getAttribute('table');
    }
}
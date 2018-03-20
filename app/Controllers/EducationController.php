<?php

namespace App\Controllers;


use App\Repositories\EducationRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

class EducationController extends BaseController
{
    /** @var EducationRepository $edurepo */
    private $edurepo;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->edurepo = $this->c->get('educationRepository');
    }

    public function index(Request $request, Response $response)
    {
        $filter = $request->getParam('filter');

        if ($filter) {
            return $response->withJson($this->edurepo->filter($filter));
        }

        $educations = $this->edurepo->all();

        return $response->withJson($educations);
    }

    public function getById(Request $request, Response $response, $args)
    {
        $course = $this->edurepo->find($args['id']);

        return $response->withJson($course);
    }


}
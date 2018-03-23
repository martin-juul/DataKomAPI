<?php

namespace App\Controllers;


use App\Repositories\StudentTypeRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class StudentTypeController extends BaseController
{
    /** @var StudentTypeRepository */
    private $studentRepo;

    /**
     * StudentTypeController constructor.
     * @param ContainerInterface $c
     * @throws \Psr\Container\ContainerExceptionInterface
     * @throws \Psr\Container\NotFoundExceptionInterface
     */
    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->studentRepo = $this->c->get('studentTypeRepository');
    }

    /**
     * @param Request $request
     * @param Response $response
     * @return object
     */
    public function index(Request $request, Response $response)
    {
        $filter = $request->getParam('filter');

        if ($filter) {
            return $response->withJson($this->studentRepo->filter($filter));
        }

        return $response->withJson($this->studentRepo->all());
    }

    public function listGroups(Request $request, Response $response)
    {
        return $response->withJson($this->studentRepo->listGroups());
    }

    public function assignedGroups(Request $request, Response $response)
    {
        return $response->withJson($this->studentRepo->assignedGroups());
    }
}
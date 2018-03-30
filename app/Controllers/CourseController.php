<?php

namespace App\Controllers;

use App\Repositories\CourseRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class CourseController extends BaseController
{
    /** @var CourseRepository */
    private $courseRepo;

    /**
     * CourseController constructor.
     * @param ContainerInterface $c
     * @throws \Psr\Container\ContainerExceptionInterface
     * @throws \Psr\Container\NotFoundExceptionInterface
     */
    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->courseRepo = $this->c->get('courseRepository');
    }

    public function index(Request $request, Response $response) {
        $courses = $this->courseRepo->all();

        return $response->withJson($courses);
    }

    public function getByCourseId(Request $request, Response $response, array $args) {
        $course = $this->courseRepo->getByCourseId($args['courseId']);

        return $response->withJson($course);
    }
}
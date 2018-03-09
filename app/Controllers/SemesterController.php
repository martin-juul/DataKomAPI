<?php


namespace App\Controllers;


use App\Repositories\SemesterRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class SemesterController extends BaseController
{
    /** @var SemesterRepository */
    private $semesterRepo;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->semesterRepo = $this->c->get('semesterRepository');
    }

    public function getByEduId(Request $request, Response $response, $args)
    {
        $semesters = $this->semesterRepo->getSemesterCoursesByEducation($args['groupId'], $args['eduId']);

        return $response->withJson($semesters);
    }
}
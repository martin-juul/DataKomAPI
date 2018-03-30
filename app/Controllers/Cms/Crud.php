<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use App\Helpers\Url;
use App\Repositories\CourseRepository;
use App\Repositories\EducationRepository;
use App\Repositories\SemesterRepository;
use App\Repositories\StudentTypeRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

class Crud extends BaseController
{
    /** @var CourseRepository */
    private $courseRepo;

    /** @var EducationRepository */
    private $eduRepo;

    /** @var SemesterRepository */
    private $semesterRepo;

    /** @var StudentTypeRepository */
    private $studentTypeRepo;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->courseRepo = $this->c->get('courseRepository');
        $this->eduRepo = $this->c->get('educationRepository');
        $this->semesterRepo = $this->c->get('semesterRepository');
        $this->studentTypeRepo = $this->c->get('studentTypeRepository');
    }

    public function getCourses(Request $request, Response $response, array $args)
    {
        $courses = $this->courseRepo->all()->toArray();

        return $response->withJson($courses);
    }

    public function assignCourseToSemester(Request $request, Response $response, array $args)
    {
        $items = $request->getParsedBody();
        $semesterNo = $items['semester'];
        $courseNo = $items['course_no'];
        $educationId = $items['educationId'];
        $weeks = $items['weeks'];
        $studentTypeGroupId = $items['studentTypeGroupId'];

        $semesterId = $this->semesterRepo->getSemesterIdBySemesterEduId($semesterNo, $educationId)->toArray();
        $semesterId = $semesterId[0];
        $courseId = $this->courseRepo->getByCourseNo($courseNo)->toArray();
        $courseId = $courseId['id'];


        if ($this->courseRepo->assignCourseToEduGroup($courseId, $weeks, $semesterId, $studentTypeGroupId)) {
            return $response->withRedirect(Url::getReferer($request), 201);
        } else {
            return $response->withStatus(400);
        }
    }
}
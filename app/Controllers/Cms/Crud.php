<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use App\Helpers\Url;
use App\Models\Semesters;
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

    public function addSemester(Request $request, Response $response, array $args)
    {
        $items = $request->getParsedBody();
        $semesterNo = $items['semester_no'];
        $educationId = $items['education_id'];
        $studentTypeGroupId = $items['student_type_group_id'];
        $courseNo = $items['course_no'];
        $weeks = $items['weeks'];

        $semester = new Semesters();

        $semester->semester = $semesterNo;
        $semester->education_id = $educationId;
        $semester->student_type_group_id = $studentTypeGroupId;

        try {
            $semester->saveOrFail();
            $semesterId = $semester->semester_id;
            $courseId = $this->courseRepo->getByCourseNo($courseNo);
            $courseId = $courseId['id'];
            $this->courseRepo->assignCourseToEduGroup($courseId, $weeks, $semesterId, $studentTypeGroupId);

            $response = $response->withRedirect($items['r'], 201);
        } catch (\Throwable $e) {
            $response =  $response->withStatus(500)->withJson($e);
        }

        return $response;
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

        $semesterId = $this->semesterRepo->getSemesterIdBySemesterEduId($semesterNo, $educationId, $studentTypeGroupId)->toArray();
        $semesterId = $semesterId[0];
        $courseId = $this->courseRepo->getByCourseNo($courseNo);
        $courseId = $courseId['id'];


        if ($this->courseRepo->assignCourseToEduGroup($courseId, $weeks, $semesterId, $studentTypeGroupId)) {
            $response = $response->withStatus(201);
        } else {
            $response = $response->withStatus(500);
        }

        return $response;
    }
}
<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use App\Repositories\CourseRepository;
use App\Repositories\EducationRepository;
use App\Repositories\SemesterRepository;
use App\Repositories\StudentTypeRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class Dashboard extends BaseController
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

    public function index(Request $request, Response $response)
    {
        return $this->c->view->render($response, 'cms/page/home.twig');
    }

    public function courses(Request $request, Response $response)
    {
        $courses = $this->courseRepo->all()->toArray();

        $this->c->view->render($response, 'cms/page/courses.twig', [
            'courses' => $courses
        ]);

        return $response;
    }

    public function courseEdit(Request $request, Response $response, array $args)
    {
        $courseId = $args['courseId'];

        $course = $this->courseRepo->getById($courseId)->toArray();

        $this->c->view->render($response, 'cms/page/courses/edit.twig', [
            'course' => $course
        ]);

        return $response;
    }

    public function educations(Request $request, Response $response)
    {
        $educations = $this->eduRepo->all()->toArray();
        $this->c->view->render($response, 'cms/page/educations.twig', [
            'educations' => $educations
        ]);

        return $response;
    }

    public function semesters(Request $request, Response $response)
    {
        $educations = $this->eduRepo->getEducationsWithGroups();

        $this->c->view->render($response, 'cms/page/semesters.twig', [
            'educations' => $educations
        ]);

        return $response;
    }

    public function semesterEdit(Request $request, Response $response, array $args)
    {
        $educationId = $args['eduId'];
        $studentTypeGroupId = $args['groupId'];

        $education = $this->eduRepo->find($educationId);

        $studentTypeGroup = $this->studentTypeRepo
            ->findGroupById($studentTypeGroupId)
            ->toArray();

        $semesters = $this->semesterRepo
            ->getSemesterCoursesByEducation($studentTypeGroupId, $educationId);

        $this->c->view->render($response, 'cms/page/semesters/edit.twig', [
            'education' => $education,
            'studentTypeGroup' => $studentTypeGroup,
            'semesters' => $semesters,
        ]);

        return $response;
    }
}
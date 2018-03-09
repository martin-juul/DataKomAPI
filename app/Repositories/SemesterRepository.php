<?php


namespace App\Repositories;


use App\Models\Semesters;

class SemesterRepository
{
    public function getSemesterCoursesByEducation(int $studentTypeGroupId, int $educationId) {
        return Semesters::getSemestersByGroupId($studentTypeGroupId, $educationId);
    }
}
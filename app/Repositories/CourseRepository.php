<?php

namespace App\Repositories;

use App\Models\Course;

class CourseRepository
{
    public function all()
    {
        return Course::all();
    }

    public function find($id, $columns = ['*']) {
        return Course::find($id, $columns);
    }

    public function getByCourseNo($courseNo) {
        return Course::where('course_no', $courseNo)->firstOrFail();
    }

    public function getById($id) {
        return Course::where('id', $id)->firstOrFail();
    }

    public function assignCourseToEduGroup(int $courseId,
                                           string $weeks,
                                           int $semesterId,
                                           int $studentTypeGroupId)
    {
        try {
            Course::assignCourseToEduGroup($courseId, $weeks, $semesterId, $studentTypeGroupId);
            return true;
        } catch (\Exception $exception) {
            return false;
        }
    }
}
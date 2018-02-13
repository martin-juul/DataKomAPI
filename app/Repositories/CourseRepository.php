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

    public function getByCourseId($courseId) {
        return Course::where('course_no', $courseId)->firstOrFail();
    }
}
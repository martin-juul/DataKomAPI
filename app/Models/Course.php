<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;

class Course extends Model
{
    protected $table = 'courses';
    protected $fillable = [
        'course_no',
        'name',
        'school_attendance_desc',
        'internship_desc'
    ];

    public static function assignCourseToEduGroup(int $courseId,
                                                  string $weeks,
                                                  int $semesterId,
                                                  int $studentTypeGroupId)
    {
        DB::table('courses_to_semesters')
            ->insert([
                'semester_id' => $semesterId,
                'course_id' => $courseId
            ]);

        DB::table('course_length')
            ->insert([
                'course_id' => $courseId,
                'student_group_id' => $studentTypeGroupId,
                'semester_id' => $semesterId,
                'course_length' => $weeks
            ]);
    }

}
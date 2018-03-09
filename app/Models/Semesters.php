<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;

class Semesters extends Model
{
    protected $table = 'semesters';
    protected $primaryKey = 'semester_id';
    protected $fillable = [
        'semester'
    ];
    protected $hidden = [
        'semester_id'
    ];

    public static function getSemestersByGroupId(int $studentTypeGroupId, int $educationId) {
        return DB::table('semesters')
            ->join('courses_to_semesters', function ($join) {
                $join->on('semesters.semester_id', '=', 'courses_to_semesters.semester_id');
            })
            ->join('courses', function ($join) {
                $join->on('courses_to_semesters.course_id', '=', 'courses.id');
            })
            ->get([
                'semesters.student_type_group_id',
                'semesters.education_id',
                'semesters.semester',
                'courses.course_no',
                'courses.name',
                'courses.school_attendance_desc',
                'courses.internship_desc'
            ])
            ->where('student_type_group_id', '=', $studentTypeGroupId)
            ->where('education_id', '=', $educationId);
    }

}
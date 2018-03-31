<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;
use Illuminate\Database\Query\JoinClause;

class Semesters extends Model
{
    const TABLE_NAME = 'semesters';
    protected $table = self::TABLE_NAME;
    protected $primaryKey = 'semester_id';
    protected $fillable = [
        'semester',
        'student_type_group_id',
        'education_id'
    ];

    /**
     * @param int $studentTypeGroupId
     * @param int $educationId
     * @return \Illuminate\Support\Collection
     */
    public static function getSemestersByGroupId(int $studentTypeGroupId, int $educationId)
    {
        return DB::table('student_type_groups')
            ->join(self::TABLE_NAME,
                'student_type_groups.id', '=', self::TABLE_NAME.'.student_type_group_id')
            ->join('courses_to_semesters',
                self::TABLE_NAME.'.semester_id', '=', 'courses_to_semesters.semester_id')
            ->join('courses',
                'courses_to_semesters.course_id', '=', 'courses.id')
            ->join('course_length', function (JoinClause $join) {
                $join->on('course_length.student_group_id', '=', 'student_type_groups.id');
                $join->on('courses_to_semesters.course_id', '=', 'course_length.course_id');
                $join->on('course_length.semester_id', '=', self::TABLE_NAME.'.semester_id');
            })
            ->get([
                'semesters.student_type_group_id',
                'semesters.education_id',
                'semesters.semester',
                'courses.course_no',
                'course_length.course_length',
                'courses.name',
                'courses.school_attendance_desc',
                'courses.internship_desc',
            ])
            ->where('student_type_group_id', '=', $studentTypeGroupId)
            ->where('education_id', '=', $educationId);
    }

    public static function GetColumns(string $columns)
    {
        $columns = explode('.', $columns);

        return DB::table('semesters')
            ->get($columns)
            ->toArray();
    }
}
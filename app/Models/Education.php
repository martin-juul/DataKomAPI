<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;

class Education extends Model
{
    const TABLE_NAME = 'educations';
    protected $table = 'educations';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'short_name',
        'description'
    ];

    public static function GetColumns(string $columns)
    {
        $columns = explode('.', $columns);

        return DB::table('educations')
            ->get($columns)
            ->toArray();
    }

    public static function getWithGroups()
    {
        return DB::table('educations_to_student_types')
            ->join(self::TABLE_NAME,
                'educations_to_student_types.education_id', '=', self::TABLE_NAME.'.id')
            ->join('student_types',
                'educations_to_student_types.student_type_id', '=', 'student_types.id')
            ->join('student_type_groups',
                'student_types.student_type_group_id', '=', 'student_type_groups.id')
            ->get([
                'educations_to_student_types.education_id',
                'educations_to_student_types.student_type_id',
                'educations.id',
                'educations.short_name',
                'student_types.student_type_group_id',
                'student_type_groups.id',
                'student_type_groups.name'
            ]);
    }
}
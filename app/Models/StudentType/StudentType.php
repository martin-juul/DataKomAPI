<?php

namespace App\Models\StudentType;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;

class StudentType extends Model
{
    protected $table = 'student_types';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'subtitle',
        'description'
    ];
    protected $hidden = [
        'id'
    ];

    public function studentTypeGroups() {
        return $this->belongsTo(
            StudentTypeGroup::class,
            'student_type_group_id',
            'id'
        );
    }

    public static function GetColumns(string $columns)
    {
        $columns = explode('.', $columns);

        return DB::table('student_types')
            ->get($columns)
            ->toArray();
    }
}
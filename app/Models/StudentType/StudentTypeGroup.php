<?php

namespace App\Models\StudentType;

use Illuminate\Database\Eloquent\Model;

class StudentTypeGroup extends Model
{
    protected $table = 'student_type_groups';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name'
    ];
    protected $relations = [StudentType::class];

    public function studentTypes() {
        return $this->hasMany('App\Models\StudentType\StudentType', 'student_type_group_id');
    }
}
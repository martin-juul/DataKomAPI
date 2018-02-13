<?php

namespace App\Models\StudentType;

use Illuminate\Database\Eloquent\Model;

class StudentType extends Model
{
    protected $table = 'student_types';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'subtitle',
        'description'
    ];
    protected $relations = [StudentTypeGroup::class];

    public function groups() {
        return $this->belongsToMany('App\Models\StudentType\StudentTypeGroup', 'student_types_to_group',
            'student_type_id', 'student_group_id');
    }
}
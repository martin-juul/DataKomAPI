<?php

namespace App\Models;

use App\Models\Model as Model;

class StudentType extends Model
{
    protected $table = 'student_types';
    protected $fillable = [
        'name',
        'subtitle',
        'description'
    ];

    public function StudentTypeGroup() {
        return $this->belongsToMany('App\Models\StudentTypeGroup', 'student_types_to_group',
            'student_type_id', '');
    }
}
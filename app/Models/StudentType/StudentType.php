<?php

namespace App\Models\StudentType;

use Illuminate\Database\Eloquent\Model;

class StudentType extends Model
{
    protected $table = 'student_types';
    protected $fillable = [
        'name',
        'subtitle',
        'description'
    ];

    public function groups() {
        return $this->belongsToMany('App\Models\StudentTypeGroup', 'student_types_to_group',
            'student_type_id', 'student_group_id');
    }
}
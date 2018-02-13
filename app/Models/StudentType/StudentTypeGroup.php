<?php

namespace App\Models\StudentType;

use Illuminate\Database\Eloquent\Model;

class StudentTypeGroup extends Model
{
    protected $table = 'student_type_groups';
    protected $fillable = [
        'name'
    ];
}
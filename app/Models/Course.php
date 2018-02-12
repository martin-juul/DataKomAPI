<?php

namespace App\Models;

use App\Models\Model as Model;

class Course extends Model
{
    protected $table = 'courses';
    protected $fillable = [
        'course_no',
        'name',
        'school_attendance_desc',
        'internship_desc'
    ];
}
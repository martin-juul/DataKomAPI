<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
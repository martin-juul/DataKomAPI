<?php

namespace App\Models;

use App\Models\Model as Model;

class StudentTypeGroup extends Model
{
    protected $table = 'student_type_groups';
    protected $fillable = [
        'name'
    ];
}
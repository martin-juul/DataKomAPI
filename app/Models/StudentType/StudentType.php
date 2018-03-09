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
}
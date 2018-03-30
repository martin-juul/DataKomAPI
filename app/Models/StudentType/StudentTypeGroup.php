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

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function studentTypes()
    {
        return $this->hasMany(StudentType::class, 'student_type_group_id');
    }
}
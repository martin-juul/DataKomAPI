<?php

namespace App\Repositories;

use App\Models\StudentType\StudentType;
use App\Models\StudentType\StudentTypeGroup;

class StudentTypeRepository
{

    public function all() {
        return StudentType::all();
    }

    public function listGroups() {
        return StudentTypeGroup::all();
    }

    public function assignedGroups() {
        return StudentTypeGroup::with('studentTypes')->get();
    }

    public function filter(string $columns) {
        return StudentType::GetColumns($columns);
    }

}
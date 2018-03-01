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
        $result = [];
        $groups = StudentTypeGroup::all();
        foreach ($groups as $assignedGroup) {
            foreach ($assignedGroup->studentTypes as $studentType) {
                // Looping through all types, because eloquent is stupid.
                // TODO: eager loading.
                continue;
            }
            $result[] = [$assignedGroup];
        }
        return $result;
    }

}
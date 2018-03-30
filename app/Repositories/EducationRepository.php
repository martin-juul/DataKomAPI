<?php

namespace App\Repositories;

use App\Models\Education;


class EducationRepository
{

    public function all()
    {
        return Education::all();
    }

    public function find($id, $columns = ['*'])
    {
        return Education::findOrFail($id, $columns);
    }

    public function filter(string $columns)
    {
        return Education::GetColumns($columns);
    }

    public function getEducationsWithGroups()
    {
        $items = Education::getWithGroups();
        $tree = [];

        foreach ($items as $item) {
            $educationId = $item->education_id;
            $education = $item->short_name;
            $studentTypeGroupId = $item->student_type_group_id;
            $studentTypeGroupName = $item->name;

            $tree[$educationId]['education'] = $education;
            $tree[$educationId]['educationId'] = $educationId;
            $tree[$educationId]['groups'][$studentTypeGroupId] = [
                'id' => $studentTypeGroupId,
                'name' => $studentTypeGroupName,
            ];
        }

        $tree = array_values($tree);

        return array_values($tree);
    }

}
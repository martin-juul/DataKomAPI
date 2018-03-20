<?php

namespace App\Repositories;

use App\Models\Education;


class EducationRepository
{

    public function all()
    {
        return Education::all();
    }

    public function find($id, $columns = ['*']) {
        return Education::find($id, $columns);
    }

    public function filter(string $columns)  {
        return Education::GetColumns($columns);
    }

}
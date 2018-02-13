<?php
/**
 * Created by PhpStorm.
 * User: snowy
 * Date: 13/02/2018
 * Time: 00.52
 */

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

}
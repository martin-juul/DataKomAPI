<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as BaseModel;


class Model extends BaseModel
{
    public function toJson($options = 0)
    {
        return parent::toJson($options | JSON_NUMERIC_CHECK);
    }
}
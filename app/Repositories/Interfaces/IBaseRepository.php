<?php

namespace App\Repositories\Interfaces;


interface IBaseRepository
{
    public function all();

    public function findOrFail($id, $columns = ['*']);
}
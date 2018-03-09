<?php

namespace App\Repositories;

use App\Models\Cards;

class CardsRepository
{
    public function all()
    {
        return Cards::all();
    }
}
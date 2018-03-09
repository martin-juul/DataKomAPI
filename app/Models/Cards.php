<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cards extends Model
{
    protected $table = 'cards';
    protected $fillable = [
        'name',
        'subtitle',
        'description',
        'color_id'
    ];

    protected $hidden = [
        'card_id'
    ];
}
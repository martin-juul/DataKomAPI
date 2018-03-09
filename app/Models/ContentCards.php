<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContentCards extends Model
{
    protected $table = 'content_cards';
    protected $primaryKey = 'content_card_id';
    protected $fillable = [
        'slug',
        'name',
        'subtitle',
        'description',
        'image',
        'internalLink'
    ];
    protected $hidden = [
        'content_card_id'
    ];
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $table = 'content';
    protected $primaryKey = 'content_id';
    protected $fillable = [
        'header_title',
        'header_image',
        'content',
        'slug'
    ];
}
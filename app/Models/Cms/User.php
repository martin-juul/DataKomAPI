<?php

namespace App\Models\Cms;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'adm_users';
    protected $primaryKey = 'user_id';
    protected $fillable = [
        'firstname',
        'lastname',
        'email',
        'last_login',
        'is_activated'
    ];
    protected $hidden = [
        'password'
    ];
}
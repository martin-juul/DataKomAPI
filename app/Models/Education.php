<?php

namespace App\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as DB;

class Education extends Model
{
    use Filterable;

    protected $table = 'educations';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'short_name',
        'description'
    ];

    public static function GetColumns(string $columns)
    {
        $columns = explode('.', $columns);

        return DB::table('educations')
            ->get($columns)
            ->toArray();
    }
}
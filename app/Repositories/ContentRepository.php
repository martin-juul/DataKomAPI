<?php

namespace App\Repositories;

use App\Models\Content;
use App\Models\ContentCards;

class ContentRepository
{
    public function cards()
    {
        return ContentCards::all();
    }

    /**
     * @param int|string $find
     * @return mixed
     */
    public function getContent($find)
    {
        return Content::where('slug', $find)
            ->orWhere('content_id', $find)
            ->firstOrFail();
    }
}
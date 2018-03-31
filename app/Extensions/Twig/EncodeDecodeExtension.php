<?php

namespace App\Extensions\Twig;

use Twig\TwigFilter;

class EncodeDecodeExtension extends \Twig_Extension
{
    public function getFilters()
    {
        return [
            new TwigFilter('base64encode', [$this, 'base64EncodeFilter']),
            new TwigFilter('base64decode', [$this, 'base64DecodeFilter']),
            new TwigFilter('rot13', 'str_rot13'),
            new TwigFilter('urlencode', [$this, 'urlEncode']),
        ];
    }

    // Urls

    public function urlEncode($string)
    {
        return urlencode($string);
    }

    // Cryptography

    public function base64EncodeFilter($string)
    {
        return base64_encode($string);
    }

    public function base64DecodeFilter($string)
    {
        return base64_decode($string);
    }

}
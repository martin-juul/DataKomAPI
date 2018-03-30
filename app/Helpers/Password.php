<?php

namespace App\Helpers;

class Password
{
    protected $config;

    public function __construct($config)
    {
        $this->config = $config;
    }

    public function hash($password)
    {
        $config = $this->config;
        return password_hash($password, $config['hash']['algo'], ['cost' => $config['hash']['cost']]);
    }

    public function check($password, $hash)
    {
        return password_verify($password, $hash);
    }
}
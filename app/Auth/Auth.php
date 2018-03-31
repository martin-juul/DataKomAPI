<?php

namespace App\Auth;

use App\Models\Cms\User;

class Auth
{
    public function authenticate(string $email, string $password)
    {
        $user = User::where('email', $email)->first();

        var_dump($user);

        if (!$user) {
            return false;
        }

        if (password_verify($password, $user->password)) {
            $_SESSION['user'] = $user->user_id;
            return true;
        }

        return false;
    }

    public function user()
    {
        if ($this->isLoggedIn()) {
            return User::find($_SESSION['user']);
        }
        return false;
    }

    public function isLoggedIn()
    {
        return isset($_SESSION['user']);
    }

    public function logOut()
    {
        unset($_SESSION['user']);
    }
}
<?php

namespace App\Controllers\Cms;

use App\Controllers\BaseController;
use App\Models\Cms\User;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class AuthController extends BaseController
{
    /** @var \Slim\Csrf\Guard */
    private $csrf;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->csrf = $c->get('csrf');
    }

    public function getSignUp(Request $request, Response $response)
    {
        return $this->c->view->render($response, 'cms/page/users/signup.twig');
    }

    public function postSignUp(Request $request, Response $response)
    {
        $user = new User;

        $user->firstname    = $request->getParam('first_name');
        $user->lastname     = $request->getParam('last_name');
        $user->email        = $request->getParam('email');
        $user->password     = password_hash($request->getParam('password'), PASSWORD_BCRYPT, ['cost' => 10]);
        $user->is_activated = 1;
        try {
            $user->saveOrFail();
            return $response->withRedirect($this->c->router->pathFor('adminHome'));
        } catch (\Throwable $e) {
            return $response->withStatus(500);
        }
    }


    public function getSignIn(Request $request, Response $response)
    {
        return $this->c->view->render($response, 'cms/page/users/signin.twig');
    }

    public function postSignIn(Request $request, Response $response)
    {
        $auth = $this->c->auth->authenticate(
            $request->getParam('email'),
            $request->getParam('password')
        );

        if (!$auth) {
            return $response->withRedirect($this->c->router->pathFor('adminSignIn'));
        }

        return $response->withRedirect($this->c->router->pathFor('adminHome'));
    }

    public function getSignOut(Request $request, Response $response)
    {
        $this->auth->logOut();

        return $response->withRedirect($this->c->router->pathFor('adminSignIn'));
    }
}
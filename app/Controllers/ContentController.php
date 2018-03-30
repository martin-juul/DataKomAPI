<?php

namespace App\Controllers;

use App\Repositories\ContentRepository;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class ContentController extends BaseController
{
    /** @var ContentRepository */
    private $contentRepo;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->contentRepo = $this->c->get('contentRepository');
    }

    public function cards(Request $request, Response $response) {
        $cards = $this->contentRepo->cards();

        return $response->withJson($cards);
    }

    public function content(Request $request, Response $response, $args) {
        try {
            $content = $this->contentRepo->getContent($args['id']);
            return $response->withJson($content);
        } catch(ModelNotFoundException $e) {
            return $response->withStatus(404)->withJson([
                'status' => 404,
                'error' => 'Resource was not found'
            ]);
        }
    }
}
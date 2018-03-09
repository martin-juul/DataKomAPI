<?php

namespace App\Controllers;


use App\Repositories\CardsRepository;
use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

final class CardsController extends BaseController
{
    /** @var CardsRepository */
    private $cardsRepo;

    public function __construct(ContainerInterface $c)
    {
        parent::__construct($c);
        $this->cardsRepo = $this->c->get('cardsRepository');
    }

    public function index(Request $request, Response $response) {
        $cards = $this->cardsRepo->all();

        return $response->withJson($cards);
    }
}
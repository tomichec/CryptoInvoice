<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'foo'], function () use ($router) {
    $router->get('', 'ExampleController@greeter');
    $router->post('', 'ExampleController@greetName');
});

$router->group(['prefix' => 'invoices'], function () use ($router) {
    $router->get('', 'InvoicesController@getInvoices');
    $router->post('new', 'InvoicesController@addInvoice');
    $router->get('{id}', 'InvoicesController@showInvoice');
});

$router->group(['prefix' => 'users'], function () use ($router) {
    $router->get('', 'UsersController@getUsers');
    $router->post('new', 'UsersController@addUser');
    $router->get('{id}', 'UsersController@showUser');
    $router->delete('{id}', 'UsersController@deleteUser');
});


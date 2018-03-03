<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UsersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
        header('Content-Type: application/json');
    }

    public function addUser(Request $request) {
        //

        $data = array (
            'email' => $request->input('email')
        );

        $id = app('db')->table('users')->insertGetId($data);

        /* $results = app('db')->insert("INSERT INTO users SET email=:email;", $data); */

        return json_encode($id);
    }

    //
    public function showUser ($id) {

        $results = app('db')->select("SELECT * FROM users WHERE uid=?;", [$id]);

        return json_encode($results);

    }

    public function getUsers() {

        $results = app('db')->select("SELECT * FROM users;");

        return json_encode($results);
    }

    public function deleteUser ($id) {

        $results = app('db')->delete("DELETE FROM users WHERE uid=?;", [$id]);

        return json_encode($results);
    }

}

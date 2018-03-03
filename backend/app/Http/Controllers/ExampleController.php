<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ExampleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    //

    public function greeter() {
        return 'Hello World';
    }

    public function greetName(Request $request) {
        //
        $name = $request->input('name');
        return "Hi " . $name;
    }

}

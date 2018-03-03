<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InvoicesController extends Controller
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

    //

    public function addInvoice (Request $request) {

        $data  = array (
            'fk_uid'        => 1, /* TODO: get uid from the authentication */
            'create_time'   => date("Y-m-d H:i:s"), 
            'currency'      => $request->input('currency'), 
            'amount'         => $request->input('amount'), 
            'settled_amount' => $request->input('settled_amount') ?? 0,
            'status'        => 'pending',
            'payer_email'   => $request->input('payer_email'),
            'notify_url'    => $request->input('notify_url'),
            'order_id'      => $request->input('order_id'),
            'lang'          => $request->input('lang') ?? 'en'
        );

        $id = app('db')->table('invoices')->insertGetId($data);

        return json_encode($id);
    }

    public function showInvoice ($id) {

        $results = app('db')->select("SELECT * FROM invoices WHERE invoice_id=?", [$id]);

        return json_encode($results);
    }

    public function getInvoices() {

        $results = app('db')->select("SELECT * FROM invoices");

        return json_encode($results);
    }

}

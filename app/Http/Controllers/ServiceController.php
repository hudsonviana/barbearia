<?php

namespace App\Http\Controllers;

use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = Service::all();

        if ($services) {
            return response()->json($services);
        }
        return response()->json(['error' => 'Dados não encontrados.'], 401);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $services = new Service();

        $services->name = $request->name;
		$services->description = $request->description;
		$services->cost = $request->cost;
		$services->company_id = $request->company_id;
        $services->save();

        if ($services) {
            return response()->json($services);
        }
        return response()->json(['error' => 'Dados não salvos.'], 401);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $services = Service::find($id);

        if ($services) {
            return response()->json($services);
        }
        return response()->json(['error' => 'Dados não encontrados.'], 401);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $services = Service::find($id);

        $services->name = $request->name;
		$services->description = $request->description;
		$services->cost = $request->cost;
		$services->company_id = $request->company_id;
        $services->save();

        if ($services) {
            return response()->json($services);
        }
        return response()->json(['error' => 'Dados não atualizados.'], 401);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $services = Service::find($id);

        if ($services) {
            $services->delete();
            return response()->json($services);
        }
        return response()->json(['error' => 'Dados não deletados.'], 401);
    }
}

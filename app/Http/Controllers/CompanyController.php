<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    
    // com o construct, será preciso informar o token para poder executar as demais funções
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
        $companies = Company::all();

        if ($companies) {
            return response()->json($companies);
        }
        return response()->json(['error' => 'Dados não encontrados.'], 401);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $company = new Company();

        $company->name = $request->name;
		$company->address = $request->address;
		$company->latitude = $request->latitude;
		$company->longitude = $request->longitude;
		$company->phone = $request->phone;
		$company->social_link = $request->social_link;
		$company->image = $request->image;
        $company->save();

        if ($company) {
            return response()->json(['message' => 'Companhia criada com sucesso!'], $company);
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
        $company = Company::find($id);

        if ($company) {
            return response()->json($company);
        }
        return response()->json(['error' => 'Dados não encontrados.'], 401);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $company = Company::find($id);

        $company->name = $request->name;
		$company->address = $request->address;
		$company->latitude = $request->latitude;
		$company->longitude = $request->longitude;
		$company->phone = $request->phone;
		$company->social_link = $request->social_link;
		$company->image = $request->image;
        $company->save();

        if ($company) {
            return response()->json($company);
        }
        return response()->json(['error' => 'Dados não autalizados.'], 401);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $company = Company::find($id);
        $company->remove();

        if ($company) {
            return response()->json($company);
        }
        return response()->json(['error' => 'Dados não deletados.'], 401);
    }
}

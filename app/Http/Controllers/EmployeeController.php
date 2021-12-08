<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;

class EmployeeController extends Controller
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
        $employees = Employee::with('company', 'user', 'services.schedules')->get();

        if ($employees) {
            return response()->json($employees);
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
        $employees = new Employee();

        $employees->first_name = $request->first_name;
		$employees->last_name = $request->last_name;
		$employees->image = $request->image;
		$employees->company_id = $request->company_id;
		$employees->user_id = $request->user_id;
        $employees->save();

        if ($employees) {
            return response()->json([
                'message' => 'Empregado cadastrado com sucesso!', 
                'data' => $employees
            ], 201);
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
        $employees = Employee::find($id);

        if ($employees) {
            return response()->json($employees);
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
        $employees = Employee::find($id);

        $employees->first_name = $request->first_name;
		$employees->last_name = $request->last_name;
		$employees->image = $request->image;
		$employees->company_id = $request->company_id;
		$employees->user_id = $request->user_id;
        $employees->save();

        if ($employees) {
            return response()->json([
                'message' => 'Empregado atualizado com sucesso!', 
                'data' => $employees
            ], 201);
        }
        return response()->json(['error' => 'Dados não salvos.'], 401);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $employees = Employee::find($id);

        if ($employees) {
            $employees->delete();
            return response()->json($employees);
        }
        return response()->json(['error' => 'Dados não deletados.'], 401);
    }
}

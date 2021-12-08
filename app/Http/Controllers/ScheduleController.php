<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Illuminate\Http\Request;

class ScheduleController extends Controller
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
        $schedules = Schedule::all();

        if ($schedules) {
            return response()->json($schedules);
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
        $schedules = new Schedule();

        $schedules->scheduling_date = $request->scheduling_date;
		$schedules->scheduling_hour = $request->scheduling_hour;
		$schedules->hour_start = $request->hour_start;
		$schedules->hour_end = $request->hour_end;
		$schedules->user_id = $request->user_id;
		$schedules->employee_id = $request->employee_id;
		$schedules->service_id = $request->service_id;
        $schedules->save();

        if ($schedules) {
            return response()->json($schedules);
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
        $schedules = Schedule::find($id);

        if ($schedules) {
            return response()->json($schedules);
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
        $schedules = Schedule::find($id);

        $schedules->scheduling_date = $request->scheduling_date;
		$schedules->scheduling_hour = $request->scheduling_hour;
		$schedules->hour_start = $request->hour_start;
		$schedules->hour_end = $request->hour_end;
		$schedules->user_id = $request->user_id;
		$schedules->employee_id = $request->employee_id;
		$schedules->service_id = $request->service_id;
        $schedules->save();

        if ($schedules) {
            return response()->json($schedules);
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
        $schedules = Schedule::find($id);

        if ($schedules) {
            $schedules->delete();
            return response()->json($schedules);
        }
        return response()->json(['error' => 'Dados não deletados.'], 401);
    }
}

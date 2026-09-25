<?php

namespace App\Http\Controllers;

use App\Models\Inspection;
use Illuminate\Http\Request;

class InspectionController extends Controller
{
    public function index()
    {
        return response()->json(
            Inspection::with('facility')->get()
        );
    }

    public function store(Request $request)
    {
        $inspection = Inspection::create($request->validate([
            'facility_id' => 'required|exists:facilities,id',
            'inspection_date' => 'required|date',
            'cleanliness_score' => 'required|numeric',
            'status' => 'required|string',
            'remarks' => 'nullable|string',
        ]));

        return response()->json($inspection, 201);
    }

    public function show(Inspection $inspection)
    {
        return response()->json(
            $inspection->load('facility')
        );
    }

    public function update(Request $request, Inspection $inspection)
    {
        $inspection->update($request->validate([
            'facility_id' => 'sometimes|exists:facilities,id',
            'inspection_date' => 'sometimes|date',
            'cleanliness_score' => 'sometimes|numeric',
            'status' => 'sometimes|string',
            'remarks' => 'nullable|string',
        ]));

        return response()->json($inspection);
    }

    public function destroy(Inspection $inspection)
    {
        $inspection->delete();

        return response()->json([
            'message' => 'Inspection deleted successfully'
        ]);
    }
}
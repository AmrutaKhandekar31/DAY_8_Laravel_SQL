<?php

namespace App\Http\Controllers;

use App\Models\Facility;
use Illuminate\Http\Request;

class FacilityController extends Controller
{
    public function index()
    {
        return response()->json(Facility::all());
    }

    public function store(Request $request)
    {
        $facility = Facility::create($request->validate([
            'name' => 'required|string',
            'location' => 'required|string',
            'type' => 'required|string',
            'status' => 'nullable|string',
        ]));

        return response()->json($facility, 201);
    }

    public function show(Facility $facility)
    {
        return response()->json($facility);
    }

    public function update(Request $request, Facility $facility)
    {
        $facility->update($request->validate([
            'name' => 'sometimes|string',
            'location' => 'sometimes|string',
            'type' => 'sometimes|string',
            'status' => 'sometimes|string',
        ]));

        return response()->json($facility);
    }

    public function destroy(Facility $facility)
    {
        $facility->delete();

        return response()->json([
            'message' => 'Facility deleted successfully'
        ]);
    }
}
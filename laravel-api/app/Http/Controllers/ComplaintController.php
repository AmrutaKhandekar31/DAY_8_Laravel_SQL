<?php

namespace App\Http\Controllers;

use App\Models\Complaint;
use Illuminate\Http\Request;

class ComplaintController extends Controller
{
    public function index()
    {
        return response()->json(
            Complaint::with('facility')->get()
        );
    }

    public function store(Request $request)
    {
        $complaint = Complaint::create($request->validate([
            'facility_id' => 'required|exists:facilities,id',
            'complaint_type' => 'required|string',
            'description' => 'required|string',
            'status' => 'nullable|string',
            'complaint_date' => 'required|date',
        ]));

        return response()->json($complaint, 201);
    }

    public function show(Complaint $complaint)
    {
        return response()->json(
            $complaint->load('facility')
        );
    }

    public function update(Request $request, Complaint $complaint)
    {
        $complaint->update($request->validate([
            'facility_id' => 'sometimes|exists:facilities,id',
            'complaint_type' => 'sometimes|string',
            'description' => 'sometimes|string',
            'status' => 'sometimes|string',
            'complaint_date' => 'sometimes|date',
        ]));

        return response()->json($complaint);
    }

    public function destroy(Complaint $complaint)
    {
        $complaint->delete();

        return response()->json([
            'message' => 'Complaint deleted successfully'
        ]);
    }
}
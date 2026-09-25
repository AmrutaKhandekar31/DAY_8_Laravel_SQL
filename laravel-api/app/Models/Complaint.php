<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Complaint extends Model
{
    protected $fillable = [
        'facility_id',
        'complaint_type',
        'description',
        'status',
        'complaint_date',
    ];

    public function facility()
    {
        return $this->belongsTo(Facility::class);
    }
}
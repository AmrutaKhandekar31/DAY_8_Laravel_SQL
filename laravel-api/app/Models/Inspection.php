<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inspection extends Model
{
    protected $fillable = [
        'facility_id',
        'inspection_date',
        'cleanliness_score',
        'status',
        'remarks',
    ];

    public function facility()
    {
        return $this->belongsTo(Facility::class);
    }
}
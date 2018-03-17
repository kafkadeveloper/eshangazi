<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'message', 
        'reply',
        'intent',
        'member_id',
    ];

    /**
     * Conversation belongs to a member.
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function member()
    {
        return $this->belongsTo(Member::class);
    }


    /**
     * Record member conversation intent.
     *
     * @param $member_id
     * @param $intent
     *
     * @return void
     */
    public function record($member_id, $intent)
    {
        $this->create([
            'intent'    => $intent,
            'member_id' => $member_id
        ]);
    }
}

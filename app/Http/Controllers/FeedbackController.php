<?php

namespace App\Http\Controllers;

use App\Conversation;
use App\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param BotMan $bot
     * @return \Illuminate\Http\Response
     */
    public function store(BotMan $bot)
    {
        $user = $bot->getUser();
        $user_id = $user->getId();

        $extras = $bot->getMessage()->getExtras();

        $apiIntent = $extras['apiIntent'];
        $apiReply = $extras['apiReply'];

        $bot->typesAndWaits(1);

        $bot->reply($apiReply);



        Feedback::create([
            'feeback'    => $apiIntent,
            'member_id'  => $member->id
        ]);

        $member = Member::where('user_platform_id', '=', $user_id)->first();

        if($member)
        {
            Conversation::create([
                'intent'    => $apiIntent,
                'member_id' => $member->id
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Feedback  $feedback
     * @return \Illuminate\Http\Response
     */
    public function show(Feedback $feedback)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Feedback  $feedback
     * @return \Illuminate\Http\Response
     */
    public function edit(Feedback $feedback)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Feedback  $feedback
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Feedback $feedback)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Feedback  $feedback
     * @return \Illuminate\Http\Response
     */
    public function destroy(Feedback $feedback)
    {
        //
    }
}

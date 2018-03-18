<?php

namespace App\Http\Controllers;

use App\Member;
use App\Conversation;
use BotMan\BotMan\BotMan;
use App\Http\Conversations\QuizConversation;
use App\Http\Conversations\FeedbackConversation;

class BotManController extends Controller
{
    /**
     * Place your BotMan logic here.
     */
    public function handle()
    {
        $botman = app('botman');

        $botman->listen();
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function tinker()
    {
        return view('tinker');
    }

    /**
     * Loaded through routes/botman.php
     *
     * @param  BotMan $bot
     */
    public function quizConversation(BotMan $bot)
    {
        $bot->startConversation(new QuizConversation());

        $member = Member::where('user_platform_id', '=', $bot->getUser()->getId())->first();

        if($member) {
            (new Conversation())->record('Question and Answers', $member->id);
        }
    }

    /**
     * Loaded through routes/botman.php
     *
     * @param  BotMan $bot
     */
    public function feedback(BotMan $bot)
    {
        $bot->startConversation(new FeedbackConversation());

        $member = Member::where('user_platform_id', '=', $bot->getUser()->getId())->first();

        if($member)
        {
            (new Conversation())->record('Feedback', $member->id);
        }
    }

    public function listener(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();

        $apiReply = $extras['apiReply']; 

        $bot->typesAndWaits(1);   
        
        $bot->reply($apiReply);
    }
}

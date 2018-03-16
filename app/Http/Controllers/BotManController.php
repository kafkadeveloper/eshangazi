<?php

namespace App\Http\Controllers;

use BotMan\BotMan\BotMan;
use App\Http\Conversations\QuizConversation;

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
    }

    public function listener(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();

        $apiReply = $extras['apiReply']; 

        $bot->typesAndWaits(1);   
        
        $bot->reply($apiReply);
    }
}

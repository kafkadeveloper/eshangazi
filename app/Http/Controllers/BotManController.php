<?php

namespace App\Http\Controllers;

use App\Member;
use App\Conversation;
use BotMan\BotMan\BotMan;
use App\Http\Conversations\QuizConversation;
use App\Http\Conversations\SmsQuizConversation;
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
        if($bot->getDriver()->getName() === 'Web'){
            $bot->startConversation(new SmsQuizConversation());
        }else{
            $bot->startConversation(new QuizConversation());
            $bot->typesAndWaits(2);
            $bot->reply($this->customFeatures($bot->getUser()));
        }

        $member = Member::where('user_platform_id', '=', $bot->getUser()->getId())->first();

        if($member) {
            Conversation::create([
                'intent'    => 'Question and Answers',
                'member_id' => $member->id
            ]);
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
            Conversation::create([
                'intent'    => 'Feedback',
                'member_id' => $member->id
            ]);
        }
    }

    public function listener(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();

        $apiReply = $extras['apiReply']; 

        $bot->typesAndWaits(1);   
        
        $bot->reply(nl2br($apiReply));
    }

        /**
     * Show a list of other items.
     *
     * @param $bot->getUser()
     *
     * @return string
     */
    public function customFeatures($user)
    {
        $features = Question::create($user->getFirstName().' pia unaweza angalia vitu hivi!')
            ->fallback('Kumradhi, sijaweza kuuliza')
            ->callbackId('item')
            ->addButtons([
                Button::create('🏡 Vituo vya huduma')->value('Vituo vya huduma'),
                Button::create('🎮 Cheza gemu')->value('Maswali na majibu'),
                Button::create('🔁 Rudi mwanzo')->value('features')
            ]);

        return $features;
    }
}

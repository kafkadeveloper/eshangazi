<?php

namespace App\Http\Conversations;

use App\Member;
use App\Feedback;
use BotMan\BotMan\Messages\Conversations\Conversation;

class FeedbackConversation extends Conversation
{
    protected $feedback;

    public function askFeedback()
    {
        $this->ask('Andika maoni yako hapa', function(Answer $answer) {
            $this->feedback = $answer->getText();

            $user_id = $this->bot->getUser()->getId();

            $member = Member::where('user_platform_id', '=', $user_id)->first();

            if($member)
            {
                Feedback::create([
                    'feedback'  => $this->feedback,
                    'member_id' => $member->id
                ]);

                $this->say($this->bot->getUser()->getFirstName() . 'Asante kwa maoni yako, tutayafanyia kazi ');
            }
        });
    }

    /**
     * Start the conversation.
     *
     * @return mixed
     */
    public function run()
    {
        $extras = $this->bot->getMessage()->getExtras();

        $apiReply = $extras['apiReply'];

        $this->bot->typesAndWaits(1);

        $this->bot->reply($apiReply);

        $this->askFeedback();
    }
}

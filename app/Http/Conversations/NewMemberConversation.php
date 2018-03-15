<?php

namespace App\Http\Conversations;

use App\Member;
use BotMan\BotMan\BotMan;
use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Outgoing\Question;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Conversations\Conversation;

class NewMemberConversation extends Conversation
{
    protected $year_birth;

    protected $district;

    protected $bot;

    protected $user;

    public function __construct(BotMan $bot)
    {
        $this->bot = $bot;

        $this->user = $this->bot->getUser();
    }

    public function askYearBirth()
    {
        $this->bot->typesAndWaits(1);   

        $this->ask('What year were you born?, just a year.', function(Answer $answer) {
            $this->year_birth = $answer->getText();

            $this->askDistrict();
        });
    }

    public function askDistrict()
    {
        $this->bot->typesAndWaits(1);   

        $this->ask('What is your district?', function(Answer $answer) {
            $this->district = $answer->getText();

            $this->say('Great - that is all we need');

            $this->askToConfirm();
        });
    }

    public function askToConfirm()
    {
        $this->bot->typesAndWaits(1);   

        $this->say('Your name is ' .  $this->bot->getUser()->getFirstName()
            . ' you live ' . $this->district
            . ' and you were born' . $this->year_birth);

        $this->bot->typesAndWaits(1);  

        $question = Question::create('Wanna save this to the database, is this correct?')
            ->fallback('Something happened I can save, try again')
            ->callbackId('add_new_member')
            ->addButtons([
                Button::create('Of course')->value('yes'),
                Button::create('Hell no!')->value('no'),
            ]);

        return $this->ask($question, function (Answer $answer) {
            if ($answer->isInteractiveMessageReply()) 
            {
                $selectedValue = $answer->getValue(); 
                $selectedText = $answer->getText();

                if($selectedValue == 'yes')
                {
                    $this->storeMember();
                } 
                else 
                {
                    $this->bot->typesAndWaits(1);   

                    $this->say('Sorry, but we need to quickly start over.');

                    $this->bot->typesAndWaits(1);   

                    $this->askYearBirth();
                }
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
        $this->askYearBirth();
    }

    public function storeMember()
    {
        $this->bot->typesAndWaits(1);  
        $profile_pic = $this->user->getInfo()["profile_pic"];
        $gender = $this->user->getInfo()["gender"];

        $district_id = District::where('name', 'LIKE', $this->district);

        Member::create([
            'user_platform_id' => $this->user->getId(),
            'name' => $this->user->getFirstName() . ' ' . $this->user->getLastName(),
            'avatar' => $profile_pic,
            'subscribe' => 1,
            'born_year' => $this->year_birth,
            'gender' => $gender,
            'platform_id' => null,
            'district_id' => null,
        ]);

        $this->say('You rock it, welcome ' . $this->user->getFirstName() 
            . ', I just save you data to our database for reference.');
    }
}

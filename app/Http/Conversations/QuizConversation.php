<?php

namespace App\Http\Conversations;

use App\Question;
use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Conversations\Conversation;
use BotMan\BotMan\Messages\Outgoing\Question as BotManQuestion;

class QuizConversation extends Conversation
{
    protected $correct;
    protected $score = 0;
    protected $iterations = 0;
    protected $data;

    /**
     * Start conversation
     */
    public function startConv()
    {
        $Question = BotManQuestion::create('Karibu '.$this->bot->getUser()->getFirstName(). ' kwenye maswali na majibu')
                ->fallback('Unable to start game')
                ->callbackId('start_game')
                ->addButtons([
                    Button::create('Cheza')->value('yes'),
                    Button::create('Baadae')->value('no')
                ]);
        return $this->ask($Question, function (Answer $answer) {
            if($answer->getValue() === 'yes'){
                $this->say("Bofya kwenye jibu sahihi.");
                $this->askQuestion();
            }else{
                $this->say("Asante ".$this->bot->getUser()->getFirstName() .
                                    "!, karibu ujaribu kucheza muda wowote.. 👋");
            }
        });
    }

    /**
     * Asking questions
     */
    public function askQuestion()
    {
        if($this->iterations == 0)
            $this->data = Question::with('answers')->inRandomOrder()->take(5)->get();

        if(! $this->data->isEmpty())
        {
            $question = $this->data[$this->iterations]->question;

            $answers = [];

            foreach($this->data[$this->iterations]->answers as $answer)
            {
                $answers[] = $answer->answer;

                if($answer->correct == 1)
                    $this->correct = $answer->answer;

            }

            shuffle($answers);

            $question_pass = BotManQuestion::create($question)
                ->fallback('Unable to ask question')
                ->callbackId('ask_question');

            foreach($answers as $answer)
            {
                $question_pass->addButtons([
                    Button::create($answer)->value($answer)
                ]);
            }

            return $this->ask($question_pass, function (Answer $answer) {
                $this->iterations++;

                if ($answer->isInteractiveMessageReply())
                {
                    if ($answer->getValue() === $this->correct)
                    {
                        $this->score += 1;

                        $this->say("Swal." .
                            $this->iterations . "/" .
                            $this->data->count(). ". ✔️ Sahihi 👍, umeshinda alama 1.");
                    } else {
                        $this->say("Swal." .
                            $this->iterations . "/" .
                            $this->data->count() . ". ❌ Si-sahihi, sahihi ni " .
                            $this->correct . ", alama 0.");
                    }

                    if($this->iterations < $this->data->count())
                    {
                        $this->askQuestion();
                    }
                    else
                    {
                        if($this->score == $this->data->count())
                        {
                            $this->say("Hongera 👏👏 " .
                                $this->bot->getUser()->getFirstName() .
                                "!, umepata ".$this->score . "/"
                                . $this->data->count() .
                                " . Hongeraaa! 🏆🏆");
                        }else if($this->score >= ($this->data->count()/2))
                        {
                            $this->say("Umefanya vizuri 👏 " .
                                $this->bot->getUser()->getFirstName() .
                                "!, umepata " .
                                $this->score . "/" .
                                $this->data->count() .
                                ". Endelea kucheza.");
                        }else{
                            $this->say($this->bot->getUser()->getFirstName() .
                                "!, Naamini unaweza kufanya vizuri zaidi ya " .
                                $this->score . "/" . $this->data->count() .
                                ". Kila la heri! 👊");
                        }
                        
                        $this->bot->typesAndWaits(2);

                        $question_conf = BotManQuestion::create($this->bot->getUser()->getFirstName() .
                            ", Je, ungependa kucheza awamu nyingine?")
                            ->fallback("Unable to ask for repeat confirmantion")
                            ->callbackId("ask_for_repeat")
                            ->addButtons([
                                Button::create("Ndio")->value("yes"),
                                Button::create("Hapana")->value("no"),
                            ]);

                        $this->ask($question_conf, function(Answer $answer)
                        {
                            if ($answer->getValue() === 'yes')
                            {
                                $this->score = 0;
                                $this->iterations = 0;
                                $this->askQuestion();
                            }
                            else if ($answer->getValue() === 'no')
                            {
                                $this->say("Asante ".$this->bot->getUser()->getFirstName() .
                                    "!, karibu ujaribu kucheza tena muda wowote.. 👋");
                            }
                        });
                    }
                    
                } else {
                    $question_wrong = BotManQuestion::create("Oooh❗😬😬, " .
                        $this->bot->getUser()->getFirstName() .
                        "! Inaonekana kuna kitu hakijaenda sawa, Tafadhali azinsha upya!")
                        ->fallback("Something went wrong")
                        ->callbackId("something_is_wrong")
                        ->addButtons([
                            Button::create("Azisha")->value("yes"),
                            Button::create("Hapana")->value("no"),
                        ]);

                    $this->ask($question_wrong, function(Answer $answer)
                    {
                        if ($answer->getValue() === 'yes')
                        {
                            $this->score = 0;
                            $this->iterations = 0;
                            $this->askQuestion();
                        }
                        else if ($answer->getValue() === 'no')
                        {
                            $this->say("Ooh pole 🙇‍ " .
                                $this->bot->getUser()->getFirstName() .
                                "!, karibu ujaribu kucheza tena muda wowote.. 👋");
                            $this->say($this->customFeatures($this->bot->getUser()));
                        }
                    });
                }
            });

        }else{
            $this->say('Hakua maswali kwa sasa, rudi baadae...');
            $this->say($this->customFeatures($this->bot->getUser()));
        }
    }

    /**
     * Start the conversation.
     *
     * @return mixed
     */
    public function run()
    {
        $this->startConv();
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

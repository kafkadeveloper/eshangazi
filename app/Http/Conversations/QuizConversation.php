<?php

namespace App\Http\Conversations;

use App\Question;
use Illuminate\Support\Facades\Cache;
use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Outgoing\Question as BotManQuestion;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Conversations\Conversation;

class QuizConversation extends Conversation
{
    protected $correct;
    protected $score = 0;
    protected $iterations = 0;
    protected $data;

    /**
     * First question
     */
    public function askQuestion()
    {
        if($this->iterations == 0) $this->data = Question::with('answers')->inRandomOrder()->take(5)->get();
        if(! $this->data->isEmpty()){
            $question = $this->data[$this->iterations]->question;
            $answers = [];
            foreach($this->data[$this->iterations]->answers as $answer)
            {
                $answers[] = $answer->answer;
                if($answer->correct == 1) $this->correct = $answer->answer;

            }

            shuffle($answers);
            //Cache::forget("solution");

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
                if ($answer->isInteractiveMessageReply()) {
                    if ($answer->getValue() === $this->correct) {
                        $this->score += 1;
                        $this->say("Qn.".$this->iterations."/".$this->data->count().". ✔️ Correct 👍, you win 1 point.");
                    } else {
                        $this->say("Qn.".$this->iterations."/".$this->data->count().". ❌ Incorrect, it was ".$this->correct.", 0 point.");
                    }

                    if($this->iterations < $this->data->count()){
                        $this->askQuestion();
                    }else{
                        if($this->score == $this->data->count())
                        {
                            $this->say("Bravo 👏👏 ".$this->bot->getUser()->getFirstName()."!, you have scored ".$this->score."/".$this->data->count().". Congratulations! 🏆");
                        }else if($this->score >= ($this->data->count()/2)){
                            $this->say("You did well 👏 ".$this->bot->getUser()->getFirstName()."!, your total points are ".$this->score." out of ".$this->data->count().". Good keep playing.");
                        }else{
                            $this->say($this->bot->getUser()->getFirstName()."!, I believe you can do better than ".$this->score."/".$this->data->count().". Best of lucky next time! 👊");
                        }
                        
                        $this->bot->typesAndWaits(2);
                        $question_conf = BotManQuestion::create($this->bot->getUser()->getFirstName().", Do you want to play another round?")
                            ->fallback("Unable to ask for repeat confirmantion")
                            ->callbackId("ask_for_repeat")
                            ->addButtons([
                                Button::create("Yes")->value("yes"),
                                Button::create("No")->value("no"),
                            ]);
                        $this->ask($question_conf, function(Answer $answer){
                            if ($answer->getValue() === 'yes') {
                                $this->score = 0;
                                $this->iterations = 0;
                                $this->askQuestion();
                            } else if ($answer->getValue() === 'no') {
                                $this->say("Thanks ".$this->bot->getUser()->getFirstName()."!, you are welcome to try again any time.. 👋");
                            }
                        });
                    }
                    
                } else {
                    $question_wrong = BotManQuestion::create("Oops❗😬😬, ".$this->bot->getUser()->getFirstName()."! It looks something went wrong, Please start again?")
                            ->fallback("Something went wrong")
                            ->callbackId("something_is_wrong")
                            ->addButtons([
                                Button::create("Start")->value("yes"),
                                Button::create("No")->value("no"),
                            ]);
                    $this->ask($question_wrong, function(Answer $answer){
                        if ($answer->getValue() === 'yes') {
                            $this->score = 0;
                            $this->iterations = 0;
                            $this->askQuestion();
                        } else if ($answer->getValue() === 'no') {
                            $this->say("Ooh sorry 🙇‍ ".$this->bot->getUser()->getFirstName()."!, you are welcome to try again any time.. 👋");
                        }
                    });
                }
            });

        }else{
            $this->say('No questions at the moment, comming sooon..');
        }
    }

    /**
     * Start the conversation.
     *
     * @return mixed
     */
    public function run()
    {
        $this->say("Click on the correct answer.");
        $this->askQuestion();
    }
}

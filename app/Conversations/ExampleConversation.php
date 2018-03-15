<?php

namespace App\Conversations;

use Illuminate\Support\Facades\Cache;
use Illuminate\Foundation\Inspiring;
use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Outgoing\Question;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Conversations\Conversation;

class ExampleConversation extends Conversation
{
    protected $correct;

    /**
     * First question
     */
    public function askQuestion()
    {
        $data = get_object_vars(json_decode(file_get_contents('https://opentdb.com/api.php?amount=1&category=9&type=multiple')));
        $question = $data["results"][0];
        
        $this->correct = $question->correct_answer;
        Cache::forget("solution");

        $question_pass = Question::create($question->question)
            ->fallback('Unable to ask question')
            ->callbackId('ask_reason')
            ->addButtons([
                Button::create($question->incorrect_answers[0])->value($question->incorrect_answers[0]),
                Button::create($question->incorrect_answers[1])->value($question->incorrect_answers[1]),
                Button::create($question->incorrect_answers[2])->value($question->incorrect_answers[2]),
                Button::create($question->correct_answer)->value($question->correct_answer),
            ]);

        return $this->ask($question_pass, function (Answer $answer) {
            if ($answer->isInteractiveMessageReply()) {
                if ($answer->getValue() === $this->correct) {
                    $this->say("Correct...");
                } else {
                    $this->say("Incorrect...");
                }

                $this->askQuestion();
            } else {
                $this->say("Not interactive");
            }
        });
    }

    /**
     * Start the conversation
     */
    public function run()
    {
        $this->askQuestion();
    }
}

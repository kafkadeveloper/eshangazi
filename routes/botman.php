<?php

use App\ItemCategory;
use BotMan\BotMan\BotMan;
use App\Http\Controllers\ItemController;
use BotMan\BotMan\Middleware\Dialogflow;
use App\Http\Controllers\BotManController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\CenterController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\PartnerController;
use BotMan\BotMan\Messages\Outgoing\Question;
use App\Http\Controllers\ItemCategoryController;
use App\Http\Controllers\MessageDetailController;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;

$botman = resolve('botman');

$botman->hears('This is a default test', function (BotMan $bot) {
    $bot->reply('Hello yourself.');
});


$botman->hears('Majaridio ya content', function (BotMan $bot) {
    $majaribio = Question::create('Ujumbe wa majaribio')
                    ->fallback('Unable to create a new test')
                    ->callbackId('majaribio');

    $majaribio->addButtons([
        Button::create('This is a default test')->value('This is a default test'),
        Button::create('Uzazi wa mpango')->value('Uzazi wa mpango')
    ]);

    $bot->reply($majaribio);
});

$dialogflow = Dialogflow::create(env('DIALOGFLOW_KEY'))->listenForAction();

$botman->middleware->received($dialogflow);

$botman->hears(env('APP_ACTION') . '.questions', BotManController::class.'@quizConversation')->middleware($dialogflow);
//$botman->hears(env('APP_ACTION') . '.fallback', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.greetings.hello', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.greetings.how_are_you', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.greetings.bye', BotManController::class.'@listener')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.started', MemberController::class.'@started')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.started.yes', MemberController::class.'@store')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.started.no', MemberController::class.'@reject')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.item.categories', ItemCategoryController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.items', ItemController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.centers', CenterController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.services', ServiceController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.experts', PartnerController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears(env('APP_ACTION') . '.experts.district', PartnerController::class.'@showByDistrictBotMan')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.messages', MessageController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.message.details', MessageDetailController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears(env('APP_ACTION') . '.feedback', BotManController::class.'@feedback')->middleware($dialogflow);
<?php

use BotMan\BotMan\BotMan;
use App\Http\Controllers\ItemController;
use BotMan\BotMan\Middleware\Dialogflow; 
use App\Http\Controllers\BotManController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\CenterController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\ItemCategoryController;

$botman = resolve('botman');
$botman->hears('Start', BotManController::class.'@startConversation');

$dialogflow = Dialogflow::create(env('DIALOGFLOW_KEY'))->listenForAction();

$botman->middleware->received($dialogflow);

//$botman->hears('maswali', BotManController::class.'@quizConversation');
$botman->hears('whitelabel.questions', BotManController::class.'@quizConversation')->middleware($dialogflow);
$botman->hears('whitelabel.fallback', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('whitelabel.greetings.hello', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('whitelabel.greetings.how_are_you', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('whitelabel.greetings.bye', BotManController::class.'@listener')->middleware($dialogflow);

$botman->hears('whitelabel.started', MemberController::class.'@started')->middleware($dialogflow);
$botman->hears('whitelabel.started.yes', MemberController::class.'@store')->middleware($dialogflow);
$botman->hears('whitelabel.started.no', MemberController::class.'@reject')->middleware($dialogflow);

$botman->hears('whitelabel.item.categories', ItemCategoryController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('whitelabel.items', ItemController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('whitelabel.centers', CenterController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('whitelabel.services', ServiceController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('whitelabel.experts', PartnerController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('whitelabel.experts.district', PartnerController::class.'@showByDistrictBotMan')->middleware($dialogflow);

$botman->hears('whitelabel.messages', MessageController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('whitelabel.message.details', MessageDetailController::class.'@showBotMan')->middleware($dialogflow);
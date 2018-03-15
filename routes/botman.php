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

$botman->hears('eshangazi.questions', BotManController::class.'@quizConversation')->middleware($dialogflow);
$botman->hears('eshangazi.fallback', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('eshangazi.greetings.hello', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('eshangazi.greetings.how_are_you', BotManController::class.'@listener')->middleware($dialogflow);
$botman->hears('eshangazi.greetings.bye', BotManController::class.'@listener')->middleware($dialogflow);

$botman->hears('eshangazi.started', MemberController::class.'@started')->middleware($dialogflow);
$botman->hears('eshangazi.started.yes', MemberController::class.'@store')->middleware($dialogflow);
$botman->hears('eshangazi.started.no', MemberController::class.'@reject')->middleware($dialogflow);

$botman->hears('eshangazi.item.categories', ItemCategoryController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('eshangazi.items', ItemController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('eshangazi.centers', CenterController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('eshangazi.services', ServiceController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('eshangazi.experts', PartnerController::class.'@showBotMan')->middleware($dialogflow);
$botman->hears('eshangazi.experts.district', PartnerController::class.'@showByDistrictBotMan')->middleware($dialogflow);

$botman->hears('eshangazi.messages', MessageController::class.'@showBotMan')->middleware($dialogflow);

$botman->hears('eshangazi.message.details', MessageDetailController::class.'@showBotMan')->middleware($dialogflow);
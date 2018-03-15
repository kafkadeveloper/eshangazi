<?php

namespace App\Messages;

use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class Template
{
    public function generic($items)
    {
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($items as $item)
        {
            $template_list->addElements([
                Element::create($item->name)
                    ->subtitle($item->description)
                    ->image('https://white-label-bot.herokuapp.com/img/demo.jpg')
                    ->addButton(ElementButton::create('View Details')
                        ->payload($item->name)->type('postback'))
            ]);
        } 

        return $template_list;
    }
}
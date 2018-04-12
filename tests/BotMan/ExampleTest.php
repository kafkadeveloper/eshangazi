<?php

namespace Tests\BotMan;

use Illuminate\Foundation\Inspiring;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $this->bot
            ->receives('Only for testing')
            ->assertReply('Hello I head, Only for testing.');
    }
}

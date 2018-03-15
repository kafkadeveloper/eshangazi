<?php

namespace Tests;

use App\BotManTester;
use BotMan\BotMan\BotMan;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    /**
     * @var BotMan
     */
    protected $botman;

    /**
     * @var BotManTester
     */
    protected $bot;

    protected function setUp()
    {
        parent::setUp();
        
        $this->withoutExceptionHandling();
    }

    protected function signIn($user = null)
    {
        $user = $user ?: create('App\User');
        $this->actingAs($user);

        return $this;
    }
}

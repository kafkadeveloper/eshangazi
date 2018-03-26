<?php

namespace Tests\Feature;

use App\Message;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MessageTest extends TestCase
{    
    use RefreshDatabase;

    /**
     * Test guests may not create a new message.
     *
     * @return void
     */
    public function testGuestMayNotCreateMessage()
    {
        $this->withExceptionHandling();

        $this->get(route('create-message'))
            ->assertRedirect(route('login'));

        $this->post(route('store-message'))
            ->assertRedirect(route('login'));
    }
    
    /**
     * Test to create a new message.
     *
     * @return void
     */
    /*public function testAuthenticatedUserMayCreateMessage()
    {
        $this->signIn();

        $message = make(Message::class);

        $this->post(route('store-message'), $message->toArray());

        $this->assertDatabaseHas('messages', [
            'title'         => $message->title,
            'description'   => $message->description,
            'thumbnail'     => $message->thumbnail,
            'gender'        => $message->gender,
            'minimum_age'   => $message->min_age,
            'created_by'    => auth()->id()
        ]);
    }*/

    /*
     * Guests Cannot View the Messages
     * @return void
     * */
    public function testUnAuthenticatedUsersCannotViewMessage()
    {
        $this->withExceptionHandling();

        $this->get(route('show-message', 1))
             ->assertRedirect(route('login'));
    }

    /*
     * Authenticated Users Can View a Message
     * 
     * @return void
     * */
    public function  testAuthenticatedUserCanViewMessage()
    {
        $this->signIn();

        $message = create(Message::class, ['created_by' => auth()->id()]);

        $this->get(route('show-message', $message))
              ->assertSee($message->title);
    }

    /**
     * Test guests may not edit a new message.
     *
     * @return void
     */
    public function testGuestMayNotEditMessage()
    {
        $this->withExceptionHandling();

        $this->get(route('edit-message', 1))
            ->assertRedirect(route('login'));

        $this->patch(route('update-message', 1))
            ->assertRedirect('login');
    }

    /**
     * Test to update a message.
     *
     * @return void
     */
    public function testAuthenticatedUserMayUpdateMessage()
    {
        $this->signIn();

        $message = create(Message::class, ['created_by' => auth()->id()]);

        $this->patch(route('update-message', $message), $message->toArray());

        $this->assertDatabaseHas('messages', ['id' => $message->id, 'description' => $message->description]);
    }

    /**
     * Test guests may not delete message.
     *
     * @return void
     */
    public function testGuestMayNotDeleteMessage()
    {
        $this->withExceptionHandling();

        $this->delete(route('delete-message', 1))
            ->assertRedirect(route('login'));
    }

    /**
     * Test to update a message.
     *
     * @return void
     */
    public function testAuthenticatedUserMayDeleteMessage()
    {
        $this->signIn();

        $message = create(Message::class, ['created_by' => auth()->id()]);

        
        $this->delete(route('delete-message', $message));

        $this->assertDatabaseMissing('messages', ['id' => $message->id]);
    }
}

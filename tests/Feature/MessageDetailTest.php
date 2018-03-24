<?php

namespace Tests\Feature;

use App\MessageDetail;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MessageDetailTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test guests may not create a new message.
     *
     * @return void
     */
    public function testGuestMayNotCreateMessageDetail()
    {
        $this->withExceptionHandling();

        $this->get(route('create-message-detail'))
            ->assertRedirect(route('login'));

        $this->post(route('store-message-detail'))
            ->assertRedirect(route('login'));
    }
    
    /**
     * Test to create a new message.
     *
     * @return void
     */
    /*public function testAuthenticatedUserMayCreateMessageDetail()
    {
        $this->signIn();

        $messageDetail = make(MessageDetail::class, ['created_by' => auth()->id()]);

        $this->post(route('store-message-detail'), $messageDetail->toArray());

        $this->assertDatabaseHas('message_details', [
            'title'         => $messageDetail->title,
            'description'   => $messageDetail->description,
            'thumbnail'     => $messageDetail->thumbnail,
            'message_id'    => $messageDetail->message_id,
            'created_by'    => auth()->id()
        ]);
    }*/

    /*
     * Guests Cannot View the message details
     * 
     * @return void
     * */
    public function testUnAuthenticatedUsersCannotViewMessageDetail()
    {
        $this->withExceptionHandling();

        $this->get(route('show-message-detail', 1))
             ->assertRedirect(route('login'));
    }

    /*
     * Authenticated Users Can View a Message Detials
     * 
     * @return void
     * */
    public function testAuthenticatedUserCanViewMessageDetail()
    {
        $this->signIn();

        $messageDetail = create(MessageDetail::class, ['created_by' => auth()->id()]);

        $this->get(route('show-message-detail', $messageDetail))
              ->assertSee($messageDetail->title);
    }

    /**
     * Test guests may not edit a new message detail.
     *
     * @return void
     */
    public function testGuestMayNotEditMessageDetail()
    {
        $this->withExceptionHandling();

        $this->get(route('edit-message-detail', 1))
            ->assertRedirect(route('login'));

        $this->patch(route('update-message-detail', 1))
            ->assertRedirect('login');
    }

    /**
     * Test to update a message detail.
     *
     * @return void
     */
    /*public function testAuthenticatedUserMayUpdateMessageDetail()
    {
        $this->signIn();

        $messageDetail = create(MessageDetail::class, ['updated_by' => auth()->id()]);

        $this->patch(route('update-message-detail', $messageDetail), $messageDetail->toArray());

        $this->assertDatabaseHas('message_details', [
            'id'            => $messageDetail->id, 
            'description'   => $messageDetail->description
        ]);
    }*/

    /**
     * Test guests may not delete message detail.
     *
     * @return void
     */
    public function testGuestMayNotDeleteMessageDetail()
    {
        $this->withExceptionHandling();

        $this->delete(route('delete-message-detail', 1))
            ->assertRedirect(route('login'));
    }

    /**
     * Test to update a message detail.
     *
     * @return void
     */
    /*public function testAuthenticatedUserMayDeleteMessageDetail()
    {
        $this->signIn();

        $messageDetail = create(MessageDetail::class, ['created_by' => auth()->id()]);

        
        $this->delete(route('delete-message-detail', $messageDetail));

        $this->assertDatabaseMissing('message_details', ['id' => $messageDetail->id]);
    }*/
}

<?php

namespace Tests\Feature;

use App\Item;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CreateItemTest extends TestCase
{
    /**
     * Gust may not be able to crate items.
     * 
     * @return void
     */

    public function testGuestMayNotCreateItem()
    {
        $this->withExceptionHandling();

        $this->get(route('create-item'))->assertRedirect(route('login'));
        $this->post(route('store-item'))->assertRedirect(route('login'));
    }

    /**
     * Authenticated user can create items
     * 
     * @return void
     */
    /*public function testAuthenticatedUserCanCreateItem()
    {
        $this->signIn();
        $item = make(Item::class);
        $this->post(route('store-item', $item->toArray()));

        $this->assertDatabaseHas('items', [
            'title' => $item->title,
            'description' => $item->description,
            'thumbnail' => $item->thumbnail,
            'age' => $item->age,
            'gender' => $item->gender,
            'created_by' => $item->created_by,
            'category_id' => $item->cagegory_id
        ]);
    }*/
}

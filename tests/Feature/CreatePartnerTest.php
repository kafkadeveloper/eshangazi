<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CreatePartnerTest extends TestCase
{
    use RefreshDatabase;
    
    /**
     * Guest may not be able to create partners.
     *
     * @return void
     */
    public function testGuestMayNotCreatePartner()
    {
        $this->withExceptionHandling();

        $this->get(route('create-partner'))
            ->assertRedirect(route('login'));

           $this->post(route('store-partner'))
              ->assertRedirect(route('login'));
    }

    /*
     * Guests Cannot View the Partners
     * @return void
     * */
    public function testUnAuthenticatedUsersCannotViewPartner()
    {
        $this->withExceptionHandling();

        $this->get(route('show-partner', ['id' => 1]))
             ->assertRedirect(route('login'));
    }

   /*
    * Unauthenticated users cannot update the partner
    *
    * @return void
    *
    * */
   public function testUnauthenticatedUsersCannotUpdatePartner()
   {
       $this->withExceptionHandling();

       $this->get(route('edit-partner', ['id' => 1]))
           ->assertRedirect(route('login'));

       $this->patch(route('update-partner', ['id' => 1]))
           ->assertRedirect(route('login'));
   }

   /*
    * Guests cannot delete the partner
    * @return void
    * */
   public function testUnauthenticatedUserCannotDeletePartner()
   {
       $this->withExceptionHandling();

       $this->delete(route('delete-partner', ['id' => 1]))
            ->assertRedirect(route('login'));
   }
}

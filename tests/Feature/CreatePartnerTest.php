<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
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

    /**
     * Authenticated users can create partiners.
     *
     * @return void
     */
    public function testAuthenticatedUserMayCreatePartner()
    {
        $this->signIn();

        $partner = make(\App\Partner::class);

        $this->post(route('store-partner', $partner->toArray()));
        
        $this->assertDatabaseHas('partners', [
            'name'          => $partner->name,
            'bio'   => $partner->bio,
            'category_id' => $partner->category_id,
            'phone' => $partner->phone,
            'email' => $partner->email,
            'address' => $partner->address
        ]);   
    }

    /*
     * Guests Cannot View the Partners
     * @return void
     * */
    public function testUnAuthenticatedUsersCannotViewPartner()
    {
        $this->withExceptionHandling();

        $partner = create(\App\Partner::class);
        $this->get(route('show-partner', ['id'=>$partner->id]))
             ->assertRedirect(route('login'));
    }

    /*
     * Authenticated Users Can View a Partner
     * @return void
     * */
    public function  testAuthenticatedUserCanViewPartner()
    {
        $this->signIn();

        $partner = create(\App\Partner::class);
        $this->get(route('show-partner', ['id'=>$partner->id]))
              ->assertSee($partner->name);
    }

   /*
    * Unauthenticated users cannot update the partner
    * @return void
    *
    * */
   public function testUnauthenticatedUsersCannotUpdatePartner()
   {
       $this->withExceptionHandling();

       $partner = create(\App\Partner::class);
       $this->get(route('edit-partner', ['id' => $partner->id]))->assertRedirect(route('login'));

       $this->patch(route('update-partner', ['id'=>$partner->id]))->assertRedirect(route('login'));
   }

   /*
    * Authenticated User Can Update Partner
    *
    * @return void
    * */

   public function  testAuthenticatedUserCanUpdatePartner()
   {
      $this->signIn();

      $partner =  create(\App\Partner::class);

      $this->patch(route('update-partner', $partner), $partner->toArray());

      $this->assertDatabaseHas('partners',
          [
              'id' => $partner->id,
              'bio'=> $partner->bio,
              'category_id'=>$partner->category_id,
              'phone' => $partner->phone,
              'email' => $partner->email,
              'address' => $partner->address
          ]);

   }

   /*
    * Guests cannot delete the partner
    * @return void
    * */
   public function testUnauthenticatedUserCannotDeletePartner()
   {
       $this->withExceptionHandling();

       $partner = create(\App\Partner::class);

       $this->delete(route('delete-partner', ['id' => $partner->id]))
            ->assertRedirect(route('login'));
   }

   /*
    * Authenticated User Can Delete Partner
    * @return void
    * */
   public function testAuthenticatedUserCanDeletePartner()
   {
       $this->signIn();

       $partner = create(\App\Partner::class);
       $this->delete(route('delete-partner', ['id'=>$partner->id]));
       $this->assertDatabaseMissing('partners', ['id'=>$partner->id]);
   }
}

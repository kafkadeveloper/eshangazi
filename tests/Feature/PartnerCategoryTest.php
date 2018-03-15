<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PartnerCategoryTest extends TestCase
{
  /*
   * A Guest cannot create a partner_category
   * @return void
   * */

  public function testUnauthenticatedUserCannotCreatePartnerCategory()
  {
      $this->withExceptionHandling();

      $this->get(route('create-category'))
          ->assertRedirect(route('login'));
      $this->post(route('store-category'))
           ->assertRedirect(route('login'));
  }

  /*
   * Authenticated User Can Create Partner Category
   *
   * @return void
   * */
  public function testAuthenticatedUserCanCreatePartnerCategory()
  {
      $this->signIn();

      $category = make(\App\PartnerCategory::class);
      $this->post(route('store-category', $category->toArray()));

      $this->assertDatabaseHas('partner_categories', [
            'name'        => $category->name,
            'description' => $category->description
      ]);
  }

  /*
   * A guest cannot view partner category
   * @return void
   * */
  public function testGuestsCannotViewPartnerCategory()
  {
      $this->withExceptionHandling();
      $category = create(\App\PartnerCategory::class);
      $this->get(route('show-category', ['id' => $category->id]))
            ->assertRedirect(route('login'));
  }

  /*
   * Authenticated user can view partner category
   * @return void
   * */
  public function testAuthenticatedUserCanViewPartnerCategory()
  {
      $this->signIn();
      $category = create(\App\PartnerCategory::class);
      $this->get(route('show-category', ['id'=>$category->id]))
            ->assertSee($category->name);
  }

  /*
   * Guests cannot edit PartnerCategory
   * @return void
   * */
  public function testGuestsCannotEditPartnerCategory()
  {
      $this->withExceptionHandling();

      $category = create(\App\PartnerCategory::class);
      $this->get(route('edit-category', ['id'=>$category->id]))
            ->assertRedirect(route('login'));
      $this->patch(route('update-category', ['id' =>$category->id]))
           ->assertRedirect(route('login'));
  }

  /*
   * Authenticated User can edit category
   * @return void
   * */
  public function testAuthenticatedUserCanEditPartnerCategory()
  {
      $this->signIn();
      $category = create(\App\PartnerCategory::class);
      $this->patch(route('update-category', ['id'=>$category->id]), [
          'name' => $category->name,
          'description' => $category->description
      ]);
      $this->assertDatabaseHas('partner_categories', [
          'name' => $category->name,
          'description' => $category->description
      ]);
  }

  /*Guests cannot delete the category
  @return void
  */
  public function testGuestsCannotDeleteCategory()
  {
      $this->withExceptionHandling();

      $category = create(\App\PartnerCategory::class);
      $this->delete(route('delete-category', ['id' => $category->id]))
            ->assertRedirect(route('login'));
  }

  /*
   * Authenticated User can Delete the category
   * @return void
   * */
  public function testAuthenticatedUserCanDeleteCategory()
  {
      $this->signIn();

      $category = create(\App\PartnerCategory::class);
      $this->delete(route('delete-category', ['id'=>$category->id]));
      $this->assertDatabaseMissing('partner_categories', ['id'=>$category->id]);
  }
}

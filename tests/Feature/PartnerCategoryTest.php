<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\PartnerCategory;

class PartnerCategoryTest extends TestCase
{
  /*
   * A Guest cannot create a partner_category
   * @return void
   *
   */

  public function testUnauthenticatedUserCannotCreatePartnerCategory()
  {
      $this->withExceptionHandling();

      $this->get(route('create-partner-category'))
          ->assertRedirect(route('login'));

      $this->post(route('store-partner-category'))
           ->assertRedirect(route('login'));
  }

  /*
   * A guest cannot view partner category
   * @return void
   * */
  public function testGuestsCannotViewPartnerCategory()
  {
      $this->withExceptionHandling();

      $this->get(route('show-partner-category', 1))
            ->assertRedirect(route('login'));
  }

  /*
   * Authenticated user can view partner category
   * @return void
   * */
  public function testAuthenticatedUserCanViewPartnerCategory()
  {
      $this->signIn();

      $category = create(PartnerCategory::class, ['created_by' => auth()->id()]);

      $this->get(route('show-partner-category', ['id' => $category->id]))
            ->assertSee($category->name);
  }

  /*
   * Guests cannot edit PartnerCategory
   * @return void
   * */
  public function testGuestsCannotEditPartnerCategory()
  {
      $this->withExceptionHandling();

      $this->get(route('edit-partner-category', 1))
            ->assertRedirect(route('login'));

      $this->patch(route('update-partner-category', 1))
           ->assertRedirect(route('login'));
  }

  /*
   * Authenticated User can edit category
   * @return void
   * */
  public function testAuthenticatedUserCanEditPartnerCategory()
  {
      $this->signIn();

      $category = create(PartnerCategory::class, ['created_by' => auth()->id()]);

      $this->patch(route('update-partner-category', ['id'=>$category->id]), [
          'name'        => $category->name,
          'description' => $category->description
      ]);

      $this->assertDatabaseHas('partner_categories', [
          'name'        => $category->name,
          'description' => $category->description
      ]);
  }

  /*Guests cannot delete the category
  @return void
  */
  public function testGuestsCannotDeleteCategory()
  {
      $this->withExceptionHandling();

      $this->delete(route('delete-partner-category', 1))
            ->assertRedirect(route('login'));
  }

  /*
   * Authenticated User can Delete the category
   * @return void
   * */
  public function testAuthenticatedUserCanDeleteCategory()
  {
      $this->signIn();

      $category = create(PartnerCategory::class, ['created_by' => auth()->id()]);

      $this->delete(route('delete-partner-category', ['id' => $category->id]));

      $this->assertDatabaseMissing('partner_categories', ['id' => $category->id]);
  }
}

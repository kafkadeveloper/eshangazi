<?php

namespace Tests\Feature;

use Tests\TestCase;

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

  /*Guests cannot delete the category
  @return void
  */
  public function testGuestsCannotDeleteCategory()
  {
      $this->withExceptionHandling();

      $this->delete(route('delete-partner-category', 1))
            ->assertRedirect(route('login'));
  }
}

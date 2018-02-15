<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('item_category_id')->unsigned();
            $table->string('title');
            $table->text('description')->nullable();
            $table->string('thumbnail', 100)->nullable();
            $table->integer('age')->nullable();
            $table->string('gender', 8);
            $table->integer('created_by')->unsigned()->nullable();
            $table->integer('updated_by')->unsigned()->nullable();
            $table->timestamps();

            $table->foreign('item_category_id')
                    ->references('id')->on('item_categories')
                    ->onDelete('cascade');
            $table->foreign('created_by')->references('id')
                    ->on('users')->onDelete('set null');
            $table->foreign('updated_by')->references('id')
                    ->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('items');
    }
}

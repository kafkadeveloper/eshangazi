<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlatformUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('platform_id');
            $table->string('platform_type')->nullable();
            $table->string('name');
            $table->integer('age');
            $table->string('gender');
            $table->string('location');
            $table->date('last_seen');
            $table->boolean('subscribed')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_users');
    }
}

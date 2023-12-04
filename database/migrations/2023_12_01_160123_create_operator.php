<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('operator')) {
            Schema::create('operator', function (Blueprint $table) {
                $table->id();
                $table->foreignId("user_id")->references("user_id")->on("users");
                $table->string("username");
                $table->string("nama");
                $table->string("password");
                $table->integer("status")->default(1);
                $table->integer("level");
                $table->timestamps();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('operator');
    }
};

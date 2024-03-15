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
        Schema::create('guru', function (Blueprint $table) {
            $table->id("guru_id");
            $table->foreignId("user_id")->references("user_id")->on("users");
            $table->string("username")->unique();
            $table->string("nama");
            $table->string("password");
            $table->integer("role");
            $table->integer("kode_guru")->unique();
            $table->integer("status")->default(1);
            $table->timestamps();
            $table->integer("created_by")->nullable();
            $table->integer("updated_by")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('guru');
    }
};

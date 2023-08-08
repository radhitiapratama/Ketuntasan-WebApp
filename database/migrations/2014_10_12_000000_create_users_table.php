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
        Schema::create('users', function (Blueprint $table) {
            $table->id("user_id");
            $table->string('username')->nullable();
            $table->string('nama')->nullable();
            $table->string('email')->unique()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->integer("role")->nullable();
            $table->integer("status")->default(1);
            $table->integer('tingkatan')->nullable();
            $table->foreignId("jurusan_id")->nullable()->references("jurusan_id")->on("jurusan");
            $table->foreignId("kelas_id")->nullable()->references("kelas_id")->on("kelas");
            $table->rememberToken();
            $table->timestamps();
            $table->integer("creted_by")->nullable();
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
        Schema::dropIfExists('users');
    }
};

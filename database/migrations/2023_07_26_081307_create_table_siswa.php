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
        Schema::create('siswa', function (Blueprint $table) {
            $table->id('siswa_id');
            $table->foreignId("user_id")->references("user_id")->on("users");
            $table->string("username");
            $table->string("nama");
            $table->string("password");
            $table->integer('tingkatan');
            $table->foreignId("jurusan_id")->references("jurusan_id")->on("jurusan");
            $table->foreignId("kelas_id")->references("kelas_id")->on("kelas");
            $table->integer("role");
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
        Schema::dropIfExists('siswa');
    }
};

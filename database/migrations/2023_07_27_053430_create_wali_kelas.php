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
        Schema::create('wali_kelas', function (Blueprint $table) {
            $table->id("wali_kelas_id");
            $table->integer("tingkatan");
            $table->foreignId("jurusan_id")->references("jurusan_id")->on("jurusan");
            $table->foreignId("kelas_id")->references('kelas_id')->on("kelas");
            $table->foreignId("user_id")->references('user_id')->on("users");
            $table->foreignId("tahun_ajaran_id")->references("tahun_ajaran_id")->on("tahun_ajaran");
            $table->integer("status")->default(1);
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
        Schema::dropIfExists('wali_kelas');
    }
};

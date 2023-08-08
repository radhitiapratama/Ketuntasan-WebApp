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
        Schema::create('ketuntasan', function (Blueprint $table) {
            $table->id("ketuntasan_id");
            $table->foreignId("user_id")->references('user_id')->on("users");
            $table->foreignId("kelas_mapel_id")->references('kelas_mapel_id')->on("kelas_mapel");
            $table->text("desc")->nullable();
            $table->timestamp("tgl_tuntas")->nullable();
            $table->integer('tuntas')->default(0);
            $table->foreignId("tahun_ajaran_id")->references('tahun_ajaran_id')->on("tahun_ajaran");
            $table->integer('semester');
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
        Schema::dropIfExists('ketuntasan');
    }
};

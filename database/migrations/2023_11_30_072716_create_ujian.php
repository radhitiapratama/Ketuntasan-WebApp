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
        if (!Schema::hasTable('ujian')) {
            Schema::create('ujian', function (Blueprint $table) {
                $table->id();
                $table->foreignId("siswa_id")->references("siswa_id")->on("siswa");
                $table->integer("ruang");
                $table->integer("sesi");
                $table->foreignId("tahun_ajaran_id")->references("tahun_ajaran_id")->on("tahun_ajaran");
                $table->integer("semester");
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
        Schema::dropIfExists('ujian');
    }
};

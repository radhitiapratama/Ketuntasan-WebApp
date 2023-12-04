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
        if (!Schema::hasTable('keterlambatan')) {
            Schema::create('keterlambatan', function (Blueprint $table) {
                $table->id();
                $table->foreignId("ujian_id")->references("id")->on("ujian");
                $table->text("alasan_terlambat");
                $table->integer("tidak_lanjut");
                $table->integer("status")->default(1);
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
        Schema::dropIfExists('keterlambatan');
    }
};

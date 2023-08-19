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
        Schema::create('batas_waktu', function (Blueprint $table) {
            $table->id('batas_waktu_id');
            $table->string('start_date')->nullable();
            $table->string('end_date')->nullable();
            $table->foreignId("tahun_ajaran_id")->references("tahun_ajaran_id")->on("tahun_ajaran");
            $table->integer('status')->default(0);
            $table->timestamps();
            $table->integer("created_by")->nullable();
            $table->integer('updated_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('batas_waktu');
    }
};

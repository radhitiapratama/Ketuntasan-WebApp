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
        Schema::create('guru_mapel', function (Blueprint $table) {
            $table->id("guru_mapel_id");
            $table->foreignId("guru_id")->references("guru_id")->on("guru");
            $table->foreignId("mapel_id")->references('mapel_id')->on("mapel");
            $table->string("kode_guru_mapel")->nullable();
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
        Schema::dropIfExists('guru_mapel');
    }
};

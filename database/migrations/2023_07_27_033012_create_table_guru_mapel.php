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
            $table->foreignId("user_id")->references('user_id')->on("users")->onDelete('cascade');
            $table->foreignId("mapel_id")->references('mapel_id')->on("mapel")->onDelete('cascade');
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
        Schema::dropIfExists('guru_mapel');
    }
};

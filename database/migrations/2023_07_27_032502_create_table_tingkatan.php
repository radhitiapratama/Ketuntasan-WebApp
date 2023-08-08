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
        Schema::create('tingkatan', function (Blueprint $table) {
            $table->id("tingkatan_id");
            $table->string("nama_tingkatan", 255);
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
        Schema::dropIfExists('tingkatan');
    }
};

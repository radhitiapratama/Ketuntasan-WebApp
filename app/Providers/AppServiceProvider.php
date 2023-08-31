<?php

namespace App\Providers;

use App\Models\Admin;
use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\Gate;
use App\Models\User;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Gate::define("admin", function (Admin $admin) {
        //     return auth()->guard("admin")->check();
        // });

        // Gate::define("guru", function (User $user) {
        //     return auth()->guard("guru")->check();
        // });

        // Gate::define("siswa", function (User $user) {
        //     return auth()->guard("siswa")->check();
        // });
    }
}

<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\Gate;
use App\Models\User;
use Symfony\Component\CssSelector\Node\FunctionNode;

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
        Gate::define("admin", function (User $user) {
            return $user->role == 1;
        });

        Gate::define("guru", function (User $user) {
            return $user->role == 2;
        });

        Gate::define("siswa", function (User $user) {
            return $user->role == 3;
        });
    }
}

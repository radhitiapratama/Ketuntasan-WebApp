<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class isGuest
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::guard("admin")->check()) {
            return redirect("/tahun-ajaran");
        }

        if (Auth::guard("guru")->check()) {
            return redirect("/ketuntasan");
        }

        if (Auth::guard("siswa")->check()) {
            return redirect("/ketuntasan");
        }


        return $next($request);
    }
}

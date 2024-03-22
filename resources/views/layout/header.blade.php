    @if (Auth::guard('admin')->check() || Auth::guard('operator')->check())
        @php
            $tahun = DB::table('tahun_ajaran')->select('tahun_ajaran')->where('superadmin_aktif', 1)->first();
        @endphp
    @else
        @php
            $tahun = DB::table('tahun_ajaran')->select('tahun_ajaran')->where('user_aktif', 1)->first();
        @endphp
    @endif

    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>



    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        {{-- <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li> --}}
        <li class="nav-item">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <div class="d-flex" style="gap: 10px">
                    <i class="nav-icon ri-calendar-2-line"></i>
                    <p>{{ $tahun->tahun_ajaran }}</p>
                </div>
            </a>
        </li>
        <li class="nav-item mr-3">
            <div class="nav-link user-profile" data-toggle="dropdown">
                <i class="ri-user-4-line"></i>
            </div>
        </li>
    </ul>
    <div class="profile-container">
        <div iv class="box">
            <i class="ri-user-3-line"></i>
            @if (Auth::guard('admin')->check())
                <p>{{ Auth::guard('admin')->user()->nama }}</p>
            @endif

            @if (Auth::guard('guru')->check())
                <p>{{ Auth::guard('guru')->user()->nama }}</p>
            @endif

            @if (Auth::guard('siswa')->check())
                <p>{{ Auth::guard('siswa')->user()->nama }}</p>
            @endif

            @if (Auth::guard('operator')->check())
                <p>{{ Auth::guard('operator')->user()->nama }}</p>
            @endif
        </div>
    </div>

    <script>
        const userProfile = document.querySelector(".user-profile");
        userProfile.addEventListener("click", function(e) {
            e.preventDefault();
            const profileContainerEl = document.querySelector(".profile-container");
            const active = document.querySelector(".profile-container.active");
            if (active) {
                profileContainerEl.classList.remove("active");
            } else {
                profileContainerEl.classList.add("active");
            }
        });

        // $(".user-profile").mouseover(function() {
        //     $(".profile-container").css("display", 'flex');
        // });

        // $(".user-profile").mouseleave(function() {
        //     $(".profile-container").css("display", 'none');
        // });
    </script>

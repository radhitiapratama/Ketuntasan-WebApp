    @if (auth()->guard('admin'))
        @php
            $tahun = DB::table('tahun_ajaran')
                ->select('tahun_ajaran')
                ->where('superadmin_aktif', 1)
                ->first();
        @endphp
    @else
        @php
            $tahun = DB::table('tahun_ajaran')
                ->select('tahun_ajaran')
                ->where('user_aktif', 1)
                ->first();
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
        <li class="nav-item">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <div class="d-flex" style="gap: 10px">
                    <i class="ri-user-line"></i>
                    @if (auth()->guard('admin')->check())
                        <p>{{ auth()->guard('admin')->user()->nama }}</p>
                    @endif

                    @if (auth()->guard('guru')->check())
                        <p>{{ auth()->guard('guru')->user()->nama }}</p>
                    @endif

                    @if (auth()->guard('siswa')->check())
                        <p>{{ auth()->guard('siswa')->user()->nama }}</p>
                    @endif
                </div>
            </a>
        </li>
    </ul>

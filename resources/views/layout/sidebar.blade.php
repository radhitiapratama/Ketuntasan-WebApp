<!-- Brand Logo -->
<a href="#" class="brand-link">
    <img src="{{ asset('/') }}dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
        style="opacity: .8; margin-right: 20px">
    <span class="brand-text font-weight-light">Ketuntasan</span>
</a>

<!-- Sidebar -->
<div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    {{-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
            <img src="{{ asset('/') }}dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info ">
            <a href="#" class="d-block">{{ Str::limit(auth()->user()->nama, 15) }}</a>
        </div>
    </div> --}}

    <!-- Sidebar Menu -->
    <nav class="mt-2">
        @auth('admin')
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item  {{ Request::is('superadmin', 'superadmin/*') ? 'menu-open' : '' }} ">
                    <a href="#" class="nav-link {{ Request::is('superadmin', 'superadmin/*') ? 'active' : '' }} ">
                        <i class="nav-icon ri-user-line"></i>
                        <p>
                            Data User
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('superadmin') }}"
                                class="nav-link {{ Request::is('superadmin', 'superadmin/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Superadmin</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li
                    class="nav-item {{ Request::is('guru/*', 'guru', 'guru-mapel/*', 'guru-mapel', 'wali-kelas/*', 'wali-kelas') ? 'menu-open' : '' }}">
                    <a href="#"
                        class="nav-link {{ Request::is('guru/*', 'guru', 'guru-mapel/*', 'guru-mapel', 'wali-kelas/*', 'wali-kelas') ? 'active' : '' }}">
                        <i class="nav-icon ri-presentation-line"></i>
                        <p>
                            Data Guru
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('guru') }}"
                                class="nav-link {{ Request::is('guru/*', 'guru') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Guru</p>
                            </a>
                            <a href="{{ url('guru-mapel') }}"
                                class="nav-link {{ Request::is('guru-mapel/*', 'guru-mapel') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Guru Mapel</p>
                            </a>
                            <a href="{{ url('wali-kelas') }}"
                                class="nav-link {{ Request::is('wali-kelas/*', 'wali-kelas') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Wali Kelas</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li
                    class="nav-item {{ Request::is('jurusan', 'jurusan/*', 'kelas', 'kelas/*', 'kelas-mapel', 'kelas-mapel/*') ? 'menu-open' : '' }}">
                    <a href="#"
                        class="nav-link {{ Request::is('jurusan', 'jurusan/*', 'kelas', 'kelas/*', 'kelas-mapel', 'kelas-mapel/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-bank-line"></i>
                        <p>
                            Data Kelas
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('jurusan') }}"
                                class="nav-link {{ Request::is('jurusan', 'jurusan/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Jurusan</p>
                            </a>
                            <a href="{{ url('kelas') }}"
                                class="nav-link {{ Request::is('kelas', 'kelas/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Kelas</p>
                            </a>
                            <a href="{{ url('kelas-mapel') }}"
                                class="nav-link {{ Request::is('kelas-mapel', 'kelas-mapel/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Kelas Mapel</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li
                    class="nav-item {{ Request::is('siswa', 'siswa/*', 'siswa-naik-kelas', 'siswa-naik-kelas/*') ? 'menu-open' : '' }}">
                    <a href="#"
                        class="nav-link {{ Request::is('siswa', 'siswa/*', 'siswa-naik-kelas', 'siswa-naik-kelas/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-file-user-line"></i>
                        <p>
                            Data Siswa
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('siswa') }}"
                                class="nav-link {{ Request::is('siswa', 'siswa/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Siswa</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ url('siswa-naik-kelas') }}"
                                class="nav-link {{ Request::is('siswa-naik-kelas', 'siswa-naik-kelas/*') ? 'active' : '' }}">
                                <i class="ri-git-commit-line"></i>
                                <p>Naik Kelas</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="{{ url('mapel') }}" class="nav-link {{ Request::is('mapel', 'mapel/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-book-2-line"></i>
                        <p>
                            Mapel
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('batas-waktu') }}"
                        class="nav-link {{ Request::is('batas-waktu', 'batas-waktu/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-time-line"></i>
                        <p>
                            Batas Waktu
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('ketuntasan') }}"
                        class="nav-link {{ Request::is('ketuntasan', 'ketuntasan/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-article-line"></i>
                        <p>
                            Ketuntasan
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('tahun-ajaran') }}"
                        class="nav-link {{ Request::is('tahun-ajaran', 'tahun-ajaran/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-calendar-2-line"></i>
                        <p>
                            Tahun Ajaran
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('akun') }}" class="nav-link {{ Request::is('akun', 'akun/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-settings-3-line"></i>
                        <p>
                            Akun
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('logout') }}" class="nav-link">
                        <i class="nav-icon ri-logout-box-line"></i>
                        <p>
                            Logout
                        </p>
                    </a>
                </li>
            </ul>
        @endauth

        @auth('siswa')
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="{{ url('ketuntasan') }}"
                        class="nav-link {{ Request::is('ketuntasan', 'ketuntasan/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-article-line"></i>
                        <p>
                            Ketuntasan
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('akun') }}" class="nav-link {{ Request::is('akun', 'akun/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-settings-3-line"></i>
                        <p>
                            Akun
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('logout') }}" class="nav-link">
                        <i class="nav-icon ri-logout-box-line"></i>
                        <p>
                            Logout
                        </p>
                    </a>
                </li>
            </ul>
        @endauth

        @auth('guru')
            @php
                $tahun = DB::table('tahun_ajaran')
                    ->select('tahun_ajaran_id')
                    ->where('user_aktif', 1)
                    ->first();
                
                $sql_wali = DB::table('wali_kelas')
                    ->select('tingkatan', 'jurusan_id', 'kelas_id')
                    ->where(
                        'guru_id',
                        auth()
                            ->guard('guru')
                            ->user()->guru_id,
                    )
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->where('status', 1)
                    ->first();
            @endphp


            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <li class="nav-item">
                    <a href="{{ url('ketuntasan') }}"
                        class="nav-link {{ Request::is('ketuntasan', 'ketuntasan/*', 'guru/ketuntasan/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-article-line"></i>
                        <p>
                            Ketuntasan
                        </p>
                    </a>
                </li>
                @if (!empty($sql_wali))
                    <li class="nav-item">
                        <a href="{{ url('guru/wali-kelas/') }}"
                            class="nav-link {{ Request::is('guru/wali-kelas/', 'guru/wali-kelas/*') ? 'active' : '' }}">
                            <i class="nav-icon nav-icon ri-bank-line"></i>
                            <p>
                                Kelas
                            </p>
                        </a>
                    </li>
                @endif
                <li class="nav-item">
                    <a href="{{ url('akun') }}" class="nav-link {{ Request::is('akun', 'akun/*') ? 'active' : '' }}">
                        <i class="nav-icon ri-settings-3-line"></i>
                        <p>
                            Akun
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ url('logout') }}" class="nav-link">
                        <i class="nav-icon ri-logout-box-line"></i>
                        <p>
                            Logout
                        </p>
                    </a>
                </li>
            </ul>
        @endauth

    </nav>
    <!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->

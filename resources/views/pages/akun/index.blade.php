@extends('layout.main')

@section('content')
    @auth('admin')
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Akun</h1>

                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 80px ">
            <div class="col-md-6 col-12">
                <div class="profile-card">
                    <div class="profile-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="profile-body">
                        <h3 class="title">Informasi Akun</h3>
                        <div class="info-group">
                            <p class="info-key">USERNAME</p>
                            <p class="info-val">{{ $user->username }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">NAMA</p>
                            <p class="info-val">{{ $user->nama }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">ROLE</p>
                            <p class="info-val">Super admin</p>
                        </div>
                        <a href="{{ url('akun/change-password') }}" class="btn-change-pass">
                            <i class="ri-key-2-line"></i>
                            Ganti Password
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @endauth

    @auth('siswa')
        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Akun</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 80px ">
            <div class="col-md-6 col-12">
                <div class="profile-card">
                    <div class="profile-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="profile-body">
                        <h3 class="title">Informasi Akun</h3>
                        <div class="info-group">
                            <p class="info-key">TINGKATAN</p>
                            <p class="info-val">
                                @if ($user->tingkatan == 1)
                                    X
                                @elseif($user->tingkatan == 2)
                                    XI
                                @elseif($user->tingkatan == 3)
                                    XII
                                @endif
                            </p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">KELAS</p>
                            <p class="info-val">{{ $user->nama_jurusan }} | {{ $user->nama_kelas }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">USERNAME</p>
                            <p class="info-val">{{ $user->username }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">NAMA</p>
                            <p class="info-val">{{ $user->nama }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">ROLE</p>
                            <p class="info-val">Siswa</p>
                        </div>
                        <a href="{{ url('akun/change-password') }}" class="btn-change-pass">
                            <i class="ri-key-2-line"></i>
                            Ganti Password
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @endauth

    @auth('guru')
        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Akun</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 80px ">
            <div class="col-12 d-flex gap-20 flex-wrap">
                <div class="profile-card mb-5">
                    <div class="profile-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="profile-body">
                        <h3 class="title">Informasi Akun</h3>
                        <div class="info-group">
                            <p class="info-key">USERNAME</p>
                            <p class="info-val">{{ $user->username }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">NAMA</p>
                            <p class="info-val">{{ $user->nama }}</p>
                        </div>
                        <div class="info-group">
                            <p class="info-key">ROLE</p>
                            <p class="info-val">Guru</p>
                        </div>
                        <a href="{{ url('akun/change-password') }}" class="btn-change-pass">
                            <i class="ri-key-2-line"></i>
                            Ganti Password
                        </a>
                    </div>
                </div>

                <div class="mapel-card">
                    <div class="mapel-icon">
                        <i class="ri-book-2-line"></i>
                    </div>
                    <div class="mapel-body">
                        <h3 class="title">Mapel yang di ajar</h3>
                        @foreach ($mapels as $mapel)
                            <p class="mapel-item"> - {{ $mapel->nama_mapel }}</p>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    @endauth
@endsection

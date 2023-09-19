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
        <div class="row" style="margin-top: 60px ">
            <div class="col-md-6 col-12">
                <div class="account-card">
                    <div class="account-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="account-body">
                        <div class="part">
                            <p class="title">Informasi Akun</p>
                        </div>
                        <div class="part" style="margin-top: 20px">
                            <p class="part-title">USERNAME</p>
                            <p class="part-text">{{ Auth::guard('admin')->user()->username }}</p>
                        </div>
                        <div class="part">
                            <p class="part-title">NAMA</p>
                            <p class="part-text">{{ Auth::guard('admin')->user()->nama }}</p>
                        </div>
                        <div class="account-btn-wrapper">
                            <a href="{{ url('/akun/change-username') }}" class="btn-dark w-100">
                                <i class="ri-user-line"></i>
                                Ganti Username
                            </a>
                            <a href="{{ url('akun/change-password') }}" class="btn-dark w-100">
                                <i class="ri-key-line"></i>
                                Ganti Password
                            </a>
                        </div>
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
                <div class="account-card">
                    <div class="account-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="account-body">
                        <div class="part">
                            <p class="title">Informasi Akun</p>
                        </div>
                        <div class="part" style="margin-top: 20px">
                            <p class="part-title">Tingkatan</p>
                            <p class="part-text">
                                @if ($user->tingkatan == 1)
                                    X
                                @elseif($user->tingkatan == 2)
                                    XI
                                @elseif($user->tingkatan == 3)
                                    XII
                                @endif
                            </p>
                        </div>
                        <div class="part">
                            <p class="part-title">Kelas</p>
                            <p class="part-text">{{ $user->nama_jurusan }} | {{ $user->nama_kelas }}</p>
                        </div>
                        <div class="part">
                            <p class="part-title">USERNAME</p>
                            <p class="part-text">{{ $user->username }}</p>
                        </div>
                        <div class="part">
                            <p class="part-title">NAMA</p>
                            <p class="part-text">{{ $user->nama }}</p>
                        </div>
                        <div class="account-btn-wrapper" style="margin-top: 20px">
                            <a href="{{ url('/akun/change-username') }}" class="btn-dark w-100">
                                <i class="ri-user-line"></i>
                                Ganti Username
                            </a>
                            <a href="{{ url('akun/change-password') }}" class="btn-dark w-100">
                                <i class="ri-key-line"></i>
                                Ganti Password
                            </a>
                        </div>
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
                <div class="account-card" style="margin-bottom: 60px">
                    <div class="account-icon">
                        <i class="ri-user-line"></i>
                    </div>
                    <div class="account-body">
                        <div class="part">
                            <p class="title">Informasi Akun</p>
                        </div>
                        <div class="part" style="margin-top: 20px">
                            <p class="part-title">USERNAME</p>
                            <p class="part-text">{{ $user->username }}</p>
                        </div>
                        <div class="part">
                            <p class="part-title">NAMA</p>
                            <p class="part-text">{{ $user->nama }}</p>
                        </div>
                        <div class="part">
                            <p class="part-title">KODE GURU</p>
                            <p class="part-text">{{ $user->kode_guru }}</p>
                        </div>
                        <div class="account-btn-wrapper" style="margin-top: 20px">
                            <a href="{{ url('/akun/change-username') }}" class="btn-dark w-100">
                                <i class="ri-user-line"></i>
                                Ganti Username
                            </a>
                            <a href="{{ url('akun/change-password') }}" class="btn-dark w-100">
                                <i class="ri-key-line"></i>
                                Ganti Password
                            </a>
                        </div>
                    </div>
                </div>

                <div class="account-card" style="margin-bottom: 60px">
                    <div class="account-icon">
                        <i class="ri-bank-line"></i>
                    </div>
                    <div class="account-body">
                        <div class="part" style="margin-bottom: 20px">
                            <p class="title">Kelas yang di ajar</p>
                        </div>
                        @foreach ($kelases as $kelas)
                            <div class="part">
                                <p class="part-text">-
                                    @if ($kelas->tingkatan == 1)
                                        X
                                    @endif
                                    @if ($kelas->tingkatan == 2)
                                        XI
                                    @endif
                                    @if ($kelas->tingkatan == 3)
                                        XII
                                    @endif
                                    {{ $kelas->nama_jurusan }} | {{ $kelas->nama_kelas }}
                                </p>
                            </div>
                        @endforeach
                    </div>
                </div>

                <div class="account-card">
                    <div class="account-icon">
                        <i class="ri-book-line"></i>
                    </div>
                    <div class="account-body">
                        <div class="part" style="margin-bottom: 20px">
                            <p class="title">Mapel yang di ajar</p>
                        </div>
                        @foreach ($mapels as $mapel)
                            <div class="part">
                                <p class="part-text">- {{ $mapel->nama_mapel }}</p>
                            </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    @endauth
@endsection

@extends('layout.main')

@section('content')
    @can('admin')
        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Akun</h1>
                        <a href="{{ url('akun/change-password') }}" class="btn-dark">
                            <i class="ri-key-2-line"></i>
                            Ganti Password
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row justify-content-center mb-3">
                    <div class="col-md-5 col-12">
                        <div class="form-group">
                            <label for="#">Username</label>
                            <input type="text" class="form-control pointer-none" value="{{ $user->username }}">
                        </div>
                    </div>
                    <div class="col-md-5 col-12">
                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <input type="text" class="form-control pointer-none" value="{{ $user->nama }}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endcan
    @can('siswa')
        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Akun</h1>
                        <a href="{{ url('akun/change-password') }}" class="btn-dark">
                            <i class="ri-key-2-line"></i>
                            Ganti Password
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row justify-content-center mb-3">
                    <div class="col-md-5 col-12">
                        <div class="form-group">
                            <label for="#">Username</label>
                            <input type="text" class="form-control pointer-none" value="{{ $user->username }}">
                        </div>
                    </div>
                    <div class="col-md-5 col-12">
                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <input type="text" class="form-control pointer-none" value="{{ $user->nama }}">

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-12">
                        <div class="form-group">
                            <label for="#">Tingkatan</label>
                            @if ($user->tingkatan == 1)
                                <input type="text" class="form-control pointer-none" value="X">
                            @endif
                            @if ($user->tingkatan == 2)
                                <input type="text" class="form-control pointer-none" value="XI">
                            @endif
                            @if ($user->tingkatan == 3)
                                <input type="text" class="form-control pointer-none" value="XII">
                            @endif
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="form-group">
                            <label for="#">Jurusan</label>
                            <input type="text" class="form-control pointer-none" value="{{ $user->nama_jurusan }}">
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="form-group">
                            <label for="#">Kelas</label>
                            <input type="text"class="form-control pointer-none" value="{{ $user->nama_kelas }}">
                        </div>
                    </div>

                </div>
            </div>
        </div>
    @endcan
@endsection

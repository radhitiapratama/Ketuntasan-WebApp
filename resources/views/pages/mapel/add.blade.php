@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Mapel</h1>
                    <a href="/mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-6 col-12">
                    <form action="/mapel/store" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="nama_mapel">Nama Mapel</label>
                            <input type="text"
                                class="form-control
                            @error('nama_mapel')
                                is-invalid
                            @enderror
                            "
                                id="nama_mapel" name="nama_mapel" value="{{ old('nama_mapel') }}" required>
                        </div>
                        <button type="submit" class="btn-dark m-auto">
                            <i class="ri-check-line"></i>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

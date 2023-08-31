@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

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
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
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
                                    @error('nama_mapel')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Data Mapel berhasil di tambahkan",
                icon: "success",
                iconColor: 'white',
                customClass: {
                    popup: 'colored-toast'
                },
                toast: true,
                position: 'top-right',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true
            });
        @endif
    </script>
@endsection

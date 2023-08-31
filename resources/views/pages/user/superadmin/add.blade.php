@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Superadmin</h1>
                    <a href="/superadmin" class="btn-dark">
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
                    <div class="row ">
                        <div class="col-12">
                            <form action="{{ url('superadmin/store') }}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username"
                                        value="{{ old('username') }}" required>
                                    @error('username')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="nama">Nama</label>
                                    <input type="text" class="form-control" id="nama" name="nama"
                                        value="{{ old('nama') }}" required>
                                    @error('nama')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="#">Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control input-pass" name="password" required
                                            minlength="6">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text" id="show-pass">
                                                <i class="ri-eye-line"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn-dark " id="btn-submit">
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
                title: "Superadmin berhasil di tambahkan",
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
            })
        @endif
    </script>

    <script>
        const showPass = $("#show-pass");
        const inputPass = $(".input-pass");

        showPass.click(function() {
            if (inputPass.attr("type") == "text") {
                inputPass.attr('type', "password");
            } else {
                inputPass.attr("type", "text");
            }
        });
    </script>
@endsection

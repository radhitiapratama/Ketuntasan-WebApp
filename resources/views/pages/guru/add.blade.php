@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Guru</h1>
                    <a href="/guru" class="btn-dark">
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
                            <form action="{{ url('guru/store') }}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="#">Username</label>
                                    <input type="text" class="form-control" name="username" required
                                        value="{{ old('username') }}">
                                    @error('username')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="#">Nama Guru</label>
                                    <input type="text" class="form-control" name="nama_guru" required
                                        value="{{ old('nama_guru') }}">
                                    @error('nama_guru')
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
                                    @error('password')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="#">Kode Guru</label>
                                    <input type="text" class="form-control" name="kode_guru" required
                                        value="{{ old('kode_guru') }}" onkeypress="return onlyNumberKey(event)">
                                    @error('kode_guru')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <button type="submit" class="btn-dark" id="btn-submit">
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
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Guru berhasil di tambahkan",
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

    <script>
        const showPass = $("#show-pass");
        const inputPass = $(".input-pass");

        showPass.click(function() {
            if (inputPass.attr("type") == "text") {
                inputPass.attr('type', "password");
                showPass.html(`<i class="ri-eye-line"></i>`);

            } else {
                inputPass.attr("type", "text");
                showPass.html(`<i class="ri-eye-off-line"></i>`);
            }
        });


        function onlyNumberKey(evt) {
            var ASCIICode = (evt.which) ? evt.which : evt.keyCode
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                return false;
            return true;
        }
    </script>
@endsection

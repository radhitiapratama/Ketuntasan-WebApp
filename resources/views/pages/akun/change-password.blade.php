@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Ganti Password</h1>
                    <a href="{{ url('akun') }}" class="btn-dark">
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
                            <form action="{{ url('akun/change-password') }}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label for="#">Password baru</label>
                                    <div class="input-group mb-3">
                                        <input type="password" class="form-control input-pass" name="new_password"
                                            placeholder="Password baru" required minlength="6">
                                        <div class="input-group-prepend" id="show-pass">
                                            <span class="input-group-text" id="basic-addon1">
                                                <i class="ri-eye-line"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <button class="btn-dark">
                                            <i class="ri-check-line"></i>
                                            Ganti
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Password berhasil di ganti",
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
        const inputPass = $(".input-pass");
        const showPass = $("#show-pass");

        showPass.click(function() {
            if (inputPass.attr("type") == "password") {
                inputPass.attr("type", "text");
            } else {
                inputPass.attr("type", "password");
            }
        });
    </script>
@endsection

@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>


    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>


    <div class="card mb-3">
        <div class="card-body d-flex justify-content-end">
            <a href="/operator" class="btn-dark">
                Kembali
            </a>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-body">
                    <form action="/operator/store" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="#">Username</label>
                            <input type="text" class="form-control" name="username" id="#" required
                                value="{{ old('username') }}">
                        </div>
                        <div class="form-group">
                            <label for="#">Nama</label>
                            <input type="text" name="nama" class="form-control" id="#" required
                                value="{{ old('nama') }}">
                        </div>
                        <div class="form-group">
                            <label for="#">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control input-password" name="password" required
                                    minlength="6" autocomplete="off">
                                <div class="input-group-prepend">
                                    <div class="input-group-text" id="show-pass">
                                        <i class="ri-eye-off-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="#">Level</label>
                            <select name="level" id="level" class="form-control">
                                <option value="">Pilih...</option>
                                @foreach ($levels as $level)
                                    <option value="{{ $level }}" @selected($level == old('level'))>{{ $level }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn-dark">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        @if (session()->has('duplicate'))
            Swal.fire({
                title: "{{ session('duplicate') }}",
                icon: "error",
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

        @if (session()->has('success'))
            Swal.fire({
                title: "{{ session('success') }}",
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
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#level").select2(configSelect2);

        $("#show-pass").click(function() {
            const inputPassword = $(".input-password");
            if (inputPassword.attr("type") == "password") {
                inputPassword.attr("type", 'text');
                $(this).html(`<i class="ri-eye-line"></i>`);
            } else {
                inputPassword.attr("type", "password");
                $(this).html(`<i class="ri-eye-off-line"></i>`);
            }
        });
    </script>
@endsection

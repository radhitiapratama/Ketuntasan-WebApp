@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Tahun Ajaran</h1>
                    <a href="/tahun-ajaran" class="btn-dark">
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
                    <form action="/tahun-ajaran/store" method="POST">
                        @csrf
                        <div class="row justify-content-center">
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="tahun_start">Tahun</label>
                                    <input type="text" class="form-control" id="tahun_start" name="tahun_start"
                                        onkeypress="return onlyNum(event)" required>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="tahun_end">Tahun</label>
                                    <input type="text" class="form-control" id="tahun_end" name="tahun_end"
                                        onkeypress="return onlyNum(event)" required>
                                </div>
                            </div>
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

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Tahun ajaran berhasil di tambahkan",
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
        function onlyNum(event) {

            var aCode = event.which ? event.which : event.keyCode;

            if (aCode > 31 && (aCode < 48 || aCode > 57)) return false;

            return true;

        }
    </script>
@endsection

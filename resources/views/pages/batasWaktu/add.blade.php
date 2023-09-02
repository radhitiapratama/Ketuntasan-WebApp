@extends('layout.main')

@section('content')
    <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.standalone.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Batas Waktu</h1>
                    <a href="/batas-waktu" class="btn-dark">
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
                    <form action="{{ url('batas-waktu/store') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Tgl Mulai</label>
                                    <input type="text" class="form-control" name="tgl_mulai" id="tgl_mulai"
                                        value="{{ old('tgl_mulai') }}" required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Tgl Selesai</label>
                                    <input type="text" class="form-control" name="tgl_selesai" id="tgl_selesai"
                                        value="{{ old('tgl_selesai') }}" required autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 d-flex">
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Submit
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>


    <script>
        @if (session()->has('tglSelesaiLebihKecil'))
            Swal.fire({
                title: "Tgl selesai tidak boleh kecil dari tgl mulai",
                icon: "error",
                toast: true,
                position: "top-right",
                showConfirmButton: false,
                timer: 7000,
                timerProgressBar: true,
                iconColor: 'white',
                customClass: {
                    popup: 'colored-toast'
                },
            })
        @endif

        @if (session()->has('successStore'))
            Swal.fire({
                title: "Batas waktu berhasil di tambahkan",
                icon: "success",
                toast: true,
                position: "top-right",
                showConfirmButton: false,
                timer: 7000,
                timerProgressBar: true,
                iconColor: 'white',
                customClass: {
                    popup: 'colored-toast'
                },
            })
        @endif
    </script>

    <script>
        const configDatepicker = {
            autoclose: true,
            format: "dd-mm-yyyy",
        }
        $("#tgl_mulai").datepicker(configDatepicker);

        $("#tgl_selesai").datepicker(configDatepicker);
    </script>
@endsection

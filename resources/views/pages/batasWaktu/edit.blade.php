@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.standalone.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Batas Waktu</h1>
                    <a href="{{ url('batas-waktu') }}" class="btn-dark">
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
                    <form action="{{ url('batas-waktu/update') }}" method="post">
                        @csrf
                        <input type="hidden" name="batas_waktu_id" value="{{ $batasWaktu->batas_waktu_id }}">
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Tgl Mulai</label>
                                    <input type="text" class="form-control" name="tgl_mulai" id="tgl_mulai"
                                        value="{{ old('tgl_mulai', $start_date) }}" required autocomplete="off">

                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Tgl Selesai</label>
                                    <input type="text" class="form-control" name="tgl_selesai" id="tgl_selesai"
                                        value="{{ old('tgl_selesai', $end_date) }}" required autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="#">Status</label>
                                    <select name="status" id="status" class="form-control select2" required>
                                        @if ($batasWaktu->status == 1)
                                            <option value="1" selected>Aktif</option>
                                        @else
                                            @foreach ($statuses as $key => $value)
                                                <option value="{{ $key }}" @selected(old('status', $batasWaktu->status) == $key)>
                                                    {{ $value }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn-dark">
                            <i class="ri-check-line"></i>
                            Update
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
    <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
    <script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
    <script src="{{ asset('plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Batas waktu berhasil di update",
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

        @if (session()->has('tglSelesaiLebihKecil'))
            Swal.fire({
                title: "Tgl selesai tidak boleh kecil dari tgl mulai",
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
            })
        @endif
    </script>

    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $("#status").select2({
            theme: "bootstrap4",
            width: "100%",
        })

        const configDatepicker = {
            autoclose: true,
            format: "dd-mm-yyyy",
        }
        $("#tgl_mulai").datepicker(configDatepicker);

        $("#tgl_selesai").datepicker(configDatepicker);
    </script>
@endsection

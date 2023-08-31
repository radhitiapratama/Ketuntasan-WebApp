@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Kelas Mapel</h1>
                    <a href="/kelas-mapel/add" class="btn-dark">
                        <i class="ri-add-circle-fill"></i>
                        Tambah
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-md-6 col-12">
            <div class="custom-alert alert-warning">
                <div class="alert-icon">
                    <i class="ri-error-warning-line"></i>
                </div>
                <div class="alert-body">
                    <h1 class="alert-title">Peringatan !</h1>
                    <p class="alert-text">Data kelas mapel akan hilang jika berganti tahun ajaran </p>
                </div>
            </div>
        </div>
    </div>

    @if ($errors->any())
        @foreach ($errors->all() as $error)
            <div class="alert alert-danger mt-3" role="alert">
                {{ $error }}
            </div>
        @endforeach
    @endif

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex gap-20">
                    <button type="button" class="btn-excel" data-toggle="modal" data-target="#import_modal">
                        <i class="ri-file-excel-2-line"></i>
                        Import Kelas Mapel
                    </button>
                    <a href="{{ asset('excel/template-kelas-mapel.xlsx') }}" class="btn-excel">
                        <i class="ri-file-excel-2-line"></i>
                        Download Template
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        <select name="tingkatan" id="tingkatan" class="form-control">
                            <option value="" selected>Pilih...</option>
                            @foreach ($tingkatans as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="form-group">
                        <label for="">Kelas</label>
                        <select name="kelas_id" id="kelas_id" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($kelases as $kelas)
                                <option value="{{ $kelas->jurusan->jurusan_id }}|{{ $kelas->kelas_id }}">
                                    {{ $kelas->jurusan->nama_jurusan }} | {{ $kelas->nama_kelas }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-kelasMapel" style="width: 100%">
                        <thead>
                            <tr>
                                <th width="5px">#</th>
                                <th width="100px" class="text-center">Tingkatan</th>
                                <th>Nama Kelas</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    {{-- Modal Import Data Kelas --}}
    <div class="modal fade" id="import_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Import Data Kelas Mapel</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ url('kelas-mapel/import') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group mb-5">
                            <label for="#">Import Kelas Mapel</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01"
                                        aria-describedby="inputGroupFileAddon01" name="excel_file" required>
                                    <label class="custom-file-label" for="inputGroupFile01">Jenis File .xlsx</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 d-flex justify-content-center" style="gap: 20px">
                                <button type="button" class="btn-dark" data-dismiss="modal">
                                    <i class="ri-close-circle-line"></i>
                                    Batal
                                </button>
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Import
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        @if (session()->has('success_import'))
            Swal.fire({
                title: "{{ session('success_import') }}",
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

        @if (session()->has('max_row'))
            Swal.fire({
                title: "{{ session('max_row') }}",
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

        @if (session()->has('invalid_tingkatan'))
            Swal.fire({
                title: "{{ session('invalid_tingkatan') }}",
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

        @if (session()->has('kode_kelas_null'))
            Swal.fire({
                title: "{{ session('kode_kelas_null') }}",
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

        @if (session()->has('user_null'))
            Swal.fire({
                title: "{{ session('user_null') }}",
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

        @if (session()->has('user_not_teacher'))
            Swal.fire({
                title: "{{ session('user_not_teacher') }}",
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

        @if (session()->has('mapel_null'))
            Swal.fire({
                title: "{{ session('mapel_null') }}",
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

        @if (session()->has('user_null_on_mapel'))
            Swal.fire({
                title: "{{ session('user_null_on_mapel') }}",
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
    </script>
    <script>
        function loadDatatable() {
            $("#tbl-kelasMapel").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('kelas-mapel') }}",
                    data: function(data) {
                        data.tingkatan = $("#tingkatan").val();
                        data.kelas_id = $("#kelas_id").val();
                    }
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "tingkatan"
                    },
                    {
                        data: "kelas"
                    },
                    {
                        data: "settings"
                    },
                ]
            });
        }

        function clearDatatable() {
            $("#tbl-kelasMapel").DataTable().clear().destroy();
        }

        loadDatatable();

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        $("#tingkatan").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);

        $("#tingkatan").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#kelas_id").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $('input[type="file"]').change(function(e) {
            var fileName = e.target.files[0].name;
            $('.custom-file-label').html(fileName);
        });
    </script>
@endsection

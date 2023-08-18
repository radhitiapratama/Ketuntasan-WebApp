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


    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Sukses",
                text: "Data kelas mapel berhasil di tambahkan",
                icon: "success"
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
    </script>
@endsection

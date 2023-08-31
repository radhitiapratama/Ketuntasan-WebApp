@extends('layout.main')

@section('content')
    @can('admin')
        <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">


        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div
                        class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                        <h1 class="page-title">Data Ketuntasan</h1>
                        <a href="/ketuntasan/add" class="btn-dark">
                            <i class="ri-add-circle-fill"></i>
                            Tambah
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="#">Tingkatan</label>
                            <select name="tingkatan" id="tingkatan" class="form-control select2">
                                <option value="">Pilih...</option>
                                @foreach ($tingkatans as $key => $value)
                                    <option value="{{ $key }}">{{ $value }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="#">Kelas</label>
                            <select name="kelas_id" id="kelas_id" class="form-control select2">
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
                        <table class="table table-bordered" id="tbl-ketuntasan" style="width: 100%">
                            <thead>
                                <tr style="border-bottom: none !important">
                                    <th width="5px">#</th>
                                    <th width="5px">Tingkatan</th>
                                    <th>Kelas</th>
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

        <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
        <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

        <script>
            function loadDatatable() {
                $("#tbl-ketuntasan").DataTable({
                    serverSide: true,
                    processing: true,
                    ordering: false,
                    searching: false,
                    ajax: {
                        url: "{{ url('ketuntasan') }}",
                        data: function(data) {
                            data.tingkatan = $("#tingkatan").val();
                            data.kelas_id = $("#kelas_id").val();
                        }
                    },
                    drawCallback: function(res) {
                        console.log(res.json);
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
                $("#tbl-ketuntasan").DataTable().clear().destroy();
            }

            loadDatatable();

            const configSelect2 = {
                theme: "bootstrap4",
                width: "100%",
            }

            const csrfToken = $("meta[name='csrf-token']").attr("content");

            $(document).on('select2:open', () => {
                document.querySelector('.select2-search__field').focus();
            });

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
    @endcan

    @can('siswa')
        <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
        <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">

        <div class="card mb-1">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 d-flex justify-content-between">
                        <h1 class="page-title">Data Ketuntasan</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-3 col-12">
                        <div class="form-group">
                            <label for="#">Semester</label>
                            <select name="semester" id="semester" class="form-control">
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 col-12">
                        <div class="form-group">
                            <label for="#">Status</label>
                            <select name="tuntas" id="tuntas" class="form-control">
                                <option value="">Pilih...</option>
                                <option value="1">Tuntas</option>
                                <option value="0">Belum tuntas</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-bordered" id="tbl-ketuntasan" style="width: 100%">
                            <thead>
                                <tr style="border-bottom: none !important">
                                    <th width="5px">#</th>
                                    <th width="20%">Mapel</th>
                                    <th width="20%">Guru</th>
                                    <th class="text-center" width="5px">Tuntas</th>
                                    <th width="20%">Deskripsi</th>
                                    <th width="20%" class="text-center">Tgl Tuntas</th>
                                    <th class="text-center" width="5px">Semester</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
        <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

        <script>
            function loadDatatable() {
                $("#tbl-ketuntasan").DataTable({
                    serverSide: true,
                    processing: true,
                    ordering: false,
                    searching: false,
                    ajax: {
                        url: "{{ url('ketuntasan') }}",
                        data: function(data) {
                            data.semester = $("#semester").val();
                            data.tuntas = $("#tuntas").val();
                        }
                    },
                    drawCallback: function(res) {
                        console.log(res.json)
                    },
                    columns: [{
                            data: "no"
                        },
                        {
                            data: "mapel"
                        },
                        {
                            data: "guru"
                        },
                        {
                            data: "tuntas"
                        },
                        {
                            data: "desc"
                        },
                        {
                            data: "tgl_tuntas"
                        },
                        {
                            data: "semester"
                        },
                    ]
                });
            }

            function clearDatatable() {
                $("#tbl-ketuntasan").DataTable().clear().destroy();
            }

            loadDatatable();

            const configSelect2 = {
                theme: "bootstrap4",
                width: "100%",
            };

            $("#semester").select2(configSelect2);
            $("#tuntas").select2(configSelect2);

            $("#semester").change(function() {
                clearDatatable();
                loadDatatable();
            });

            $("#tuntas").change(function() {
                clearDatatable();
                loadDatatable();
            });
        </script>
    @endcan

@endsection

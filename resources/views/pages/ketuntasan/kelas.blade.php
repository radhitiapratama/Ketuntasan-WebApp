@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Detail Ketuntasan </h1>
                    <a href="/ketuntasan" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-md-2 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        <input type="text" class="form-control" @if ($tingkatan == 1) value="X" @endif
                            @if ($tingkatan == 2) value="XI" @endif
                            @if ($tingkatan == 3) value="XII" @endif disabled>
                    </div>
                </div>
                <div class="col-md-5 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <input type="text" class="form-control" value="{{ $jurusan->nama_jurusan }}" disabled>
                    </div>
                </div>
                <div class="col-md-5 col-12">
                    <div class="form-group">
                        <label for="#">Kelas</label>
                        <input type="text" class="form-control" value="{{ $kelas->nama_kelas }}" disabled>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-detailSiswa">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th style="width: 5px">#</th>
                                <th>Username</th>
                                <th>Nama Siswa</th>
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

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");

        function loadDatatable() {
            $("#tbl-detailSiswa").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('ketuntasan/kelas') }}",
                    data: function(data) {
                        data.tingkatan = {{ $tingkatan }};
                        data.jurusan_id = {{ $jurusan_id }};
                        data.kelas_id = {{ $kelas_id }}
                    }
                },
                drawCallback: function(res) {
                    console.log(res.json);
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "username"
                    },
                    {
                        data: "nama"
                    },
                    {
                        data: "settings"
                    },
                ]
            });
        }

        loadDatatable();
    </script>
@endsection

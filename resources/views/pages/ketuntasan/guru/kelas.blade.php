@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Ketuntasan Kelas </h1>
                    <a href="{{ url('ketuntasan') }}" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="#">Nama Mapel</label>
                        <input type="text" class="form-control" value="{{ $mapel->nama_mapel }}" disabled>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-detailSiswa" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th style="width: 5px">#</th>
                                <th>Tingkatan</th>
                                <th>Jurusan</th>
                                <th>Kelas</th>
                                <th class="text-center">Pengaturan</th>
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
        function loadDatatable() {
            $("#tbl-detailSiswa").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                paging: false,
                info: false,
                ajax: {
                    url: "{{ url('guru/ketuntasan/kelas') }}",
                    data: function(data) {
                        data.mapel_id = {{ $mapel_id }};
                    }
                },
                drawCallback: function(res) {
                    console.log(res.json)
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "tingkatan"
                    },
                    {
                        data: "jurusan"
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

        loadDatatable();
    </script>
@endsection

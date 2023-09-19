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

    <div class="deadline-container" style="margin: 5px 0">
        <div class="icon">
            <i class="ri-timer-line"></i>
        </div>
        <div class="deadline-body">
            <p>{{ $start_date }} - {{ $end_date }}</p>
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
                            <tr>
                                <th width="5px">#</th>
                                <th width="5px">Tingkatan</th>
                                <th>Kelas</th>
                                <th width="100px" class="text-center ">Aksi</th>
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
                searchDelay: 1500,
                ajax: {
                    url: "{{ url('guru/ketuntasan/kelas') }}",
                    data: function(data) {
                        data.mapel_id = {{ $mapel_id }};
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

        loadDatatable();
    </script>
@endsection

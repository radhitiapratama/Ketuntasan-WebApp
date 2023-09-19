@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">


    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Data Ketuntasan Siswa</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="deadline-container" style="margin: 5px 0">
        <div class="icon">
            <i class="ri-timer-line"></i>
        </div>
        <div class="deadline-body">
            @if ($start_date)
                <p>{{ $start_date }} - {{ $end_date }}</p>
            @else
                <p>Belum ada batas waktu</p>
            @endif
        </div>
    </div>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        <input type="text" class="form-control" disabled
                            @if ($data->tingkatan == 1) value="X" @endif
                            @if ($data->tingkatan == 2) value="XI" @endif
                            @if ($data->tingkatan == 3) value="XII" @endif>
                    </div>
                </div>
                <div class="col-md-6 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <input type="text" class="form-control" disabled value="{{ $data->nama_jurusan }}">
                    </div>
                </div>
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Kelas</label>
                        <input type="text" class="form-control" disabled value="{{ $data->nama_kelas }}">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-ketuntasan" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th rowspan="2" style="width: 5px; vertical-align: middle">#</th>
                                <th rowspan="2" class="text-center" style="vertical-align: middle">Nama Siswa</th>
                                <th colspan="2" class="text-center">Mapel tuntas</th>
                                <th class="text-center" rowspan="2" style="vertical-align: middle">Pengaturan</th>
                            </tr>
                            <tr>
                                <th class="text-center">Semester 1</th>
                                <th class="text-center">Semester 2</th>
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
                ajax: {
                    url: "{{ url('guru/wali-kelas') }}",
                },
                drawCallback: function(res) {
                    console.log(res.json)
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "nama"
                    },
                    {
                        data: "semester1"
                    },
                    {
                        data: "semester2"
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

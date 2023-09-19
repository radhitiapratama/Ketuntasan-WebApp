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
                    <table class="table table-bordered w-100" id="tbl-detailSiswa">
                        <thead>
                            <tr>
                                <th width="5px" class="vertical-align-middle" rowspan="2">#</th>
                                <th width="50%" class="text-center vertical-align-middle" rowspan="2">Siswa</th>
                                <th class="text-center vertical-align-middle" colspan="2">Mapel Tuntas</th>
                                <th class="text-center vertical-align-middle" rowspan="2">Aksi</th>
                            </tr>
                            <tr>
                                <th class="text-center vertical-align-middle">Semester 1</th>
                                <th class="text-center vertical-align-middle">Semester 2</th>
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
                searchDelay: 1500,
                ajax: {
                    url: "{{ url('ketuntasan/siswas') }}",
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

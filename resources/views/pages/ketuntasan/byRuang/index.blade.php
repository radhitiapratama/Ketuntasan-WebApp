@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>



    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-end" style="gap: 20px;">

                    <a href="/ketuntasan" class="btn-dark">
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-12">
            <div class="alert-box alert-success">
                <div class="alert-icon">
                    <i class="ri-error-warning-line"></i>
                </div>
                <div class="alert-body">
                    <p class="alert-title">Informasi !</p>
                    <p class="alert-text">
                        Silahkan Pilih ruang dan sesi untuk melihat siswa yang mapelnya belum tuntas !
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        {{-- <div class="card-header">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="#">Nama Guru</label>
                        <p>{{ $data_guru->nama }}</p>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="#">Nama Mapel</label>
                        <p>{{ $data_mapel->nama_mapel }}</p>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="#">Nama Kelas</label>
                        <p>{{ checkTingkatan($tingkatan) }} {{ $data_kelas->nama_jurusan }} |
                            {{ $data_kelas->nama_kelas }}</p>
                    </div>
                </div>
            </div>
        </div> --}}
        <div class="card-header">
            <div class="row">
                <div class="col-12 col-md-3">
                    <div class="form-group">
                        <label for="#">Ruang</label>
                        <select name="ruang" id="ruang" class="form-control">
                            {{-- <option value="">Pilih...</option> --}}
                            @foreach ($ruangs as $ruang)
                                <option value="{{ $ruang }}">{{ $ruang }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-12 col-md-3">
                    <div class="form-group">
                        <label for="#">Sesi</label>
                        <select name="sesi" id="sesi" class="form-control">
                            {{-- <option value="">Pilih...</option> --}}
                            @foreach ($sesis as $sesi)
                                <option value="{{ $sesi }}">{{ $sesi }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-header">
            {{-- <form action="/ketuntasan/by-guru/cetak" method="post" target="_blank">
                @csrf
                <input type="hidden" name="guru_id_cetak" value="{{ $guru_id }}">
                <input type="hidden" name="mapel_id_cetak" value="{{ $mapel_id }}">
                <input type="hidden" name="kelas_id_cetak" value="{{ $kelas_id }}">
                <input type="hidden" name="tingkatan_cetak" value="{{ $tingkatan }}">
                <input type="hidden" name="status_cetak">
                <input type="hidden" name="semester_cetak">
                <input type="hidden" name="nama_guru_cetak" value="{{ $data_guru->nama }}">
                <input type="hidden" name="nama_mapel_cetak" value="{{ $data_mapel->nama_mapel }}">
                <input type="hidden" name="nama_kelas_cetak"
                    value="{{ checkTingkatan($tingkatan) }} {{ $data_kelas->nama_jurusan }} | {{ $data_kelas->nama_kelas }} ">
                <button type="submit" class="btn-pdf">Cetak PDF <i class="ri-file-pdf-line"></i></button>
            </form> --}}
        </div>
        <div class="card-body table-responsive">
            <table width="100%" id="tbl-ketuntasans" class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center"s width="5">#</th>
                        <th>Nama Siswa</th>
                        <th>Ruang</th>
                        <th>Sesi</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        let table_columns = [{
                data: "no"
            },
            {
                data: "nama"
            },
            {
                data: "ruang"
            },
            {
                data: "sesi"
            },
            {
                data: "aksi"
            },
        ]

        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);

        function loadDatatable() {
            $("#tbl-ketuntasans").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: `/ketuntasan/by-ruang`,
                    data: function(data) {
                        data.ruang = $("#ruang").val();
                        data.sesi = $("#sesi").val();
                    }
                },
                columns: table_columns
            });
        }

        function clearDatatable() {
            $("#tbl-ketuntasans").DataTable().clear().destroy();

        }

        loadDatatable();

        $("#ruang").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#sesi").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

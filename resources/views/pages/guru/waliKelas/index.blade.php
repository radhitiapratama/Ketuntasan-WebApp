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
                    <h1 class="page-title">Data Wali Kelas</h1>
                    <a href="wali-kelas/add" class="btn-dark">
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
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        <select name="tingkatan" id="tingkatan" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($tingkatans as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <select name="jurusan_id" id="jurusan_id" class="form-control">
                            <option value="">Pilih..</option>
                            @foreach ($jurusans as $jurusan)
                                <option value="{{ $jurusan->jurusan_id }}">{{ $jurusan->nama_jurusan }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-waliKelas" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th>Wali Kelas</th>
                                <th>Tingkatan</th>
                                <th>Jurusan</th>
                                <th>Nama Kelas</th>
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


    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Sukses",
                text: "Wali kelas berhasil di tambahkan",
                icon: "success"
            });
        @endif
    </script>

    <script>
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        function loadDatatable() {
            $('#tbl-waliKelas').DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('wali-kelas') }}",
                    data: function(data) {
                        data.tingkatan = $("#tingkatan").val();
                        data.jurusan_id = $("#jurusan_id").val();
                    }
                },
                columns: [{
                        data: 'no'
                    },
                    {
                        data: 'nama'
                    },
                    {
                        data: 'tingkatan'
                    },
                    {
                        data: 'jurusan'
                    },
                    {
                        data: 'kelas'
                    },
                    {
                        data: 'settings'
                    },
                ]
            });
        };

        function clearDatatable() {
            $("#tbl-waliKelas").DataTable().clear().destroy();
        }

        loadDatatable();

        $("#tingkatan").select2(configSelect2);
        $("#jurusan_id").select2(configSelect2);

        $("#tingkatan").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#jurusan_id").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

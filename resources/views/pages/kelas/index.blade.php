@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Kelas</h1>
                    <a href="/kelas/add" class="btn-dark">
                        <i class="ri-add-circle-fill"></i>
                        Tambah
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-kelas" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th>Nama Jurusan</th>
                                <th>Nama Kelas</th>
                                <th class="text-center">Status</th>
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
            $("#tbl-kelas").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('kelas') }}",
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "jurusan"
                    },
                    {
                        data: "kelas"
                    },
                    {
                        data: "status"
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

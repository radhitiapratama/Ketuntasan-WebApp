@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Batas Waktu</h1>
                    <a href="{{ url('batas-waktu/add') }}" class="btn-dark">
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
                    <table class="table table-bordered" id="tbl-superadmin" style="width: 100%">
                        <thead>
                            <tr>
                                <th width="5px">#</th>
                                <th>Batas Waktu</th>
                                <th class="text-center">Status</th>
                                <th class="text-center" style="width: 150px">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        function loadDatatable() {
            $("#tbl-superadmin").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                ajax: {
                    url: "{{ url('batas-waktu') }}"
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "batas_waktu"
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

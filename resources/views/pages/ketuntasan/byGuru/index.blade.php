@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-end">
                    <a href="/ketuntasan" class="btn-dark">
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body table-responsive">
            <table width="100%" id="tbl-guru" class="table table-bordered">
                <thead>
                    <tr>
                        <th width="5">#</th>
                        <th>Username</th>
                        <th>Nama Guru</th>
                        <th width="10" class="text-center">Action</th>
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
        let table_columns = [{
                data: "no"
            },
            {
                data: "username"
            },
            {
                data: "nama"
            },
            {
                data: "aksi"
            },
        ];

        function loadDatatable() {
            $("#tbl-guru").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: "{{ url('/ketuntasan/by-guru') }}",
                    data: function(data) {
                        // data.status = $("#status").val();
                    }
                },
                columns: table_columns,
            });
        }

        function clearDatatable() {
            $("#tbl-guru").DataTable().clear().destroy();
        }

        loadDatatable();
    </script>
@endsection

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
        <div class="card-header">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Status</label>
                        <select name="status" id="status" class="form-control">
                            <option value="">Pilih...</option>
                            <option value="1">Aktif</option>
                            <option value="0">Nonaktif</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-kelas" style="width: 100%">
                        <thead>
                            <tr>
                                <th width="5px">#</th>
                                <th width="100px" class="text-center">Kode</th>
                                <th>Kelas</th>
                                <th class="text-center">Status</th>
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



    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>


    <script>
        function loadDatatable() {
            $("#tbl-kelas").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('kelas') }}",
                    data: function(data) {
                        data.status = $("#status").val();
                    }
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: 'kode_kelas'
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

        function clearDatatable() {
            $("#tbl-kelas").DataTable().clear().destroy();
        }

        loadDatatable();

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        $("#status").select2(configSelect2);

        $("#status").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

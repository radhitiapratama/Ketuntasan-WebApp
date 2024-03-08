@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Operator</h1>
                    <a href="{{ url('operator/add') }}" class="btn-dark">
                        <i class="ri-add-circle-fill"></i>
                        Tambah
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body table-responsive">
            <table class="table table-bordered" id="tbl-operator">
                <thead>
                    <tr>
                        <th width="5">#</th>
                        <th>Username</th>
                        <th>Nama</th>
                        <th width="5">Level</th>
                        <th width="5">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($operators as $operator)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $operator->username }}</td>
                            <td>{{ $operator->nama }}</td>
                            <td class="text-center">{{ $operator->level }}</td>
                            <td>
                                <a href="/operator/edit/{{ $operator->id }}" class="setting-edit">
                                    <i class="ri-pencil-line"></i>
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function loadDatatable() {
            $("#tbl-operator").DataTable({
                ordering: false,
            });
        }

        loadDatatable();
    </script>
@endsection

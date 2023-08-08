@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Detail Mapel Kelas</h1>
                    <a href="/kelas-mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="#">Tingkatan</label>
                                <input type="text" class="form-control" disabled
                                    @if ($detail->tingkatan == 1) value="X" @endif
                                    @if ($detail->tingkatan == 2) value="XI" @endif
                                    @if ($detail->tingkatan == 3) value="XII" @endif>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="#">Jurusan</label>
                                <input type="text" class="form-control" value="{{ $detail->nama_jurusan }}" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="#">Kelas</label>
                                <input type="text" class="form-control" value="{{ $detail->nama_kelas }}" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body ">
            <div class="table-responsive">
                <table class="table table-bordered" id="tbl-kelasMapel">
                    <thead>
                        <tr>
                            <th style="width: 5px">#</th>
                            <th>Nama Mapel</th>
                            <th>Nama Guru</th>
                            <th class="text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($mapels as $mapel)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $mapel->nama_mapel }}</td>
                                <td>{{ $mapel->nama }}</td>
                                <td class="text-center">
                                    @if ($mapel->status == 1)
                                        <span class="badge badge-success p-2">Aktif</span>
                                    @else
                                        <span class="badge badge-danger p-2">Nonaktif</span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        $("#tbl-kelasMapel").DataTable();
    </script>
@endsection

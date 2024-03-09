@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Detail Ketuntasan</h1>
                    <a href="/ketuntasan/by-guru" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <label for="#">Nama Guru</label>
            <input type="text" class="form-control pointer-none" id="#" value="{{ $data_guru->nama }}">
        </div>
        <div class="card-body table-responsive">
            <table id="tbl-guru-kelas-mapels" class="table table-bordered">
                <thead>
                    <tr>
                        <th width="5">#</th>
                        <th>Mapel</th>
                        <th class="text-center" width="5">Tingkatan</th>
                        <th>Kelas</th>
                        <th width="10">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($guruKelasMapels as $row)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $row->nama_mapel }}</td>
                            <td class="text-center">
                                @if ($row->tingkatan == '1')
                                    X
                                @endif
                                @if ($row->tingkatan == '2')
                                    XI
                                @endif
                                @if ($row->tingkatan == '3')
                                    XII
                                @endif
                            </td>
                            <td>{{ $row->nama_jurusan }} | {{ $row->nama_kelas }}</td>
                            <td class="text-center">
                                <a href="/ketuntasan/by-guru/{{ $guru_id }}/{{ $row->mapel_id }}/{{ $row->tingkatan }}/{{ $row->kelas_id }}"
                                    class="badge badge-success p-2">
                                    <i class="ri-eye-line"></i>
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script>
        $("#tbl-guru-kelas-mapels").DataTable({
            ordering: false
        });
    </script>
@endsection

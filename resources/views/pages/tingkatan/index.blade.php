@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Data Tingkatan</h1>
                    <a href="/tingkatan/add" class="btn-dark">
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
                <div class="col-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th>Tingkatan</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Pengaturan</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($tingkatans as $tingkatan)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $tingkatan->nama_tingkatan }}</td>
                                    <td class="text-center">
                                        @if ($tingkatan->status == 1)
                                            <span class="badge badge-success p-2">Aktif</span>
                                        @else
                                            <span class="badge badge-danger p-2">Nonaktif</span>
                                        @endif
                                    </td>
                                    <td>
                                        <div class="setting-icons">
                                            <a href="/tingkatan/edit/{{ $tingkatan->tingkatan_id }}"
                                                class="setting-edit m-auto">
                                                <i class="ri-pencil-line"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

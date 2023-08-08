@extends('layout.main')
@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Role</h1>
                    <a href="/role/add" class="btn-dark">
                        <i class="fa-solid fa-plus"></i>
                        Tambah
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nama Role</th>
                        <th>Pengaturan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($roles as $role)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $role->nama_role }}</td>
                            <td>
                                <a href="/role/edit/{{ $role->role_id }}" class="setting-icon">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

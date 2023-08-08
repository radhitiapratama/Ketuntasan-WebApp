@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Edit Role</h1>
                    <a href="/role" class="btn-dark">
                        <i class="fa-solid fa-arrow-left"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12">
                    <form action="/role/update" method="POST">
                        <input type="hidden" name="role_id" value="{{ $role->role_id }}">
                        @csrf
                        <div class="form-group">
                            <label for="nama_role">Nama Role</label>
                            <input type="text" class="form-control @error('nama_role') is-invalid  @enderror "
                                id="nama_role" name="nama_role"
                                @if (old('nama_role')) value="{{ old('nama_role') }}"
                            @else
                            value="{{ $role->nama_role }}" @endif>
                        </div>
                        <button type="submit" class="btn-dark m-auto">
                            <i class="fa-solid fa-check"></i>
                            Update
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

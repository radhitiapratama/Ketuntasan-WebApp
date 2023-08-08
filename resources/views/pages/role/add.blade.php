@extends('layout.main')
@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Tambah Role</h1>
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
                    <form action="/role/store" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="namaRole">Nama Role</label>
                            <input type="text" class="form-control" id="namaRole" name="namaRole">
                        </div>
                        <button type="submit" class="btn-dark m-auto">
                            <i class="fa-solid fa-check"></i>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

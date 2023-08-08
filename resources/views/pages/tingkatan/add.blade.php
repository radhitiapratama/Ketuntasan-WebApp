@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Tambah Tingkatan</h1>
                    <a href="/tingkatan" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-12">
                        <form action="/tingkatan/store" method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="nama_tingkatan">Nama Tingkatan</label>
                                <input type="text" class="form-control" id="nama_tingkatan" name="nama_tingkatan">
                            </div>
                            <button type="submit" class="btn-dark m-auto">
                                <i class="ri-check-line"></i>
                                Submit
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endsection

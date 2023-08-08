@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="page-title">Edit Tingkatan</h1>
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
                        <form action="/tingkatan/update" method="POST">
                            @csrf
                            @if (old('tingkatan_id'))
                                <input type="hidden" name="tingkatan_id" value="{{ $tingkatan->tingkatan_id }}">
                            @else
                                <input type="hidden" name="tingkatan_id" value="{{ $tingkatan->tingkatan_id }}">
                            @endif
                            <div class="form-group">
                                <label for="nama_tingkatan">Nama Tingkatan</label>
                                @if (old('nama_tingkatan'))
                                    <input type="text" class="form-control" id="nama_tingkatan" name="nama_tingkatan"
                                        value="{{ old('nama_tingkatan') }}">
                                @else
                                    <input type="text" class="form-control" id="nama_tingkatan" name="nama_tingkatan"
                                        value="{{ $tingkatan->nama_tingkatan }}">
                                @endif
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select name="status" id="status" class="form-control select2">
                                    @foreach ($statuses as $key => $value)
                                        <option value="{{ $key }}"
                                            @if ($key == $tingkatan->status) selected @endif>{{ $value }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <button type="submit" class="btn-dark m-auto">
                                <i class="ri-check-line"></i>
                                Update
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
        <script>
            $(document).on('select2:open', () => {
                document.querySelector('.select2-search__field').focus();
            });


            $(".select2").select2({
                theme: "bootstrap4",
                width: "100%",
            })
        </script>
    @endsection

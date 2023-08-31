@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Mapel</h1>
                    <a href="/mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <form action="/mapel/update" method="POST">
                                @csrf
                                <input type="hidden" name="mapel_id" value="{{ $mapel->mapel_id }}">
                                <div class="form-group">
                                    <label for="nama_mapel">Nama Mapel</label>
                                    <input type="text" class="form-control" id="nama_mapel" name="nama_mapel"
                                        value="{{ old('nama_mapel', $mapel->nama_mapel) }}" required>
                                    @error('nama_mapel')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select name="status" id="status" class="form-control select2" required>
                                        <option value=""></option>
                                        @foreach ($statuses as $key => $value)
                                            <option value="{{ $key }}" @selected(old('status', $mapel->status) == $key)>
                                                {{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Update
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('js/mapel.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Mapel berhasil di update",
                icon: "success",
                iconColor: 'white',
                customClass: {
                    popup: 'colored-toast'
                },
                toast: true,
                position: 'top-right',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true
            });
        @endif

        @if (session()->has('duplicateMapel'))
            Swal.fire({
                title: "Gagal nama mapel sudah di ada",
                icon: "error",
                iconColor: 'white',
                customClass: {
                    popup: 'colored-toast'
                },
                toast: true,
                position: 'top-right',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true
            });
        @endif
    </script>

    <script>
        $(".select2").select2({
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        });
    </script>
@endsection

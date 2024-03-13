@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit siswa terlambat</h1>
                    <a href="/keterlambatan" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-body">
                    <form action="/keterlambatan/update" method="POST">
                        @csrf
                        <input type="hidden" name="id" value="{{ $data_terlambat->id }}">
                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <input type="text" class="form-control" value="{{ $data_terlambat->nama }}" disabled>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <input type="text" name="ruang" id="ruang" class="form-control pointer-none"
                                        value="{{ old('ruang', $data_terlambat->ruang) }}" required disabled>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <input type="text" name="sesi" id="sesi" class="form-control pointer-none"
                                        value="{{ old('sesi', $data_terlambat->sesi) }}" required disabled>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Semester</label>
                                    <input type="text" name="semester" id="semester" class="form-control pointer-none"
                                        value="{{ old('semester', $data_terlambat->semester) }}" required disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="#">Alasan Terlambat</label>
                            <textarea name="alasan" class="form-control" id="alasan" cols="30" rows="5" required>{{ old('alasan', $data_terlambat->alasan_terlambat) }}</textarea>
                            @error('alasan')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="#">Tidak Lanjut</label>
                            <select name="tidak_lanjut" id="tidak_lanjut" class="form-control" required>
                                <option value="">Pilih....</option>
                                @foreach ($tidak_lanjuts as $key => $value)
                                    <option value="{{ $key }}" @selected(old('tidak_lanjut', $data_terlambat->tidak_lanjut) == $key)>{{ $value }}
                                    </option>
                                @endforeach
                            </select>
                            @error('tidak_lanjut')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <button type="submit" class="btn-dark">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        @if (session()->has('success'))
            Swal.fire({
                title: "{{ session('success') }}",
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
    </script>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect = {
            theme: "bootstrap4",
            width: "100%"
        }
        $("#tidak_lanjut").select2(configSelect);
    </script>
@endsection

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
                    <h1 class="page-title">Edit Kelas</h1>
                    <a href="/kelas" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-6 col-12">
                    <form action="/kelas/update" method="POST" id="form">
                        @csrf
                        <input type="hidden" name="kelas_id" value="{{ $kelas->kelas_id }}">
                        <div class="form-group">
                            <label for="nama_kelas">Nama Kelas</label>
                            <input type="text" class="form-control" id="nama_kelas" name="nama_kelas"
                                value="{{ old('nama_kelas', $kelas->nama_kelas) }}" required>
                            @error('nama_kelas')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="jurusan">Jurusan</label>
                            <select name="jurusan_id" id="jurusan" class="form-control select2" required>
                                @foreach ($jurusans as $jurusan)
                                    <option value="{{ $jurusan->jurusan_id }}" @selected(old('jurusan_id', $kelas->jurusan_id) == $jurusan->jurusan_id)>
                                        {{ $jurusan->nama_jurusan }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="form-control select2" required>
                                @foreach ($statuses as $key => $value)
                                    <option value="{{ $key }}" @selected(old('status', $kelas->status) == $key)>
                                        {{ $value }}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn-dark m-auto" id="btn-update">
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
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Kelas berhasil di update",
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
            })
        @endif

        @if (session()->has('duplicateKelas'))
            Swal.fire({
                title: "Nama Kelas sudah di gunakan",
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
            })
        @endif
    </script>

    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $(".select2").select2({
            theme: "bootstrap4",
            width: "100%",
        });
    </script>
@endsection

@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">


    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Wali Kelas</h1>
                    <a href="/wali-kelas" class="btn-dark">
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
                            <form action="/wali-kelas/update" method="POST">
                                @csrf
                                <input type="hidden" name="wali_kelas_id" value="{{ $waliKelas->wali_kelas_id }}">
                                <div class="row">
                                    <div class="col-md-2 col-12">
                                        <div class="form-group">
                                            <label for="#">Tingkatan</label>
                                            <input type="text" class="form-control" disabled required
                                                @if ($waliKelas->tingkatan == 1) value="X" @endif
                                                @if ($waliKelas->tingkatan == 2) value="XI" @endif
                                                @if ($waliKelas->tingkatan == 3) value="XII" @endif>
                                        </div>
                                    </div>
                                    <div class="col-md-10 col-12">
                                        <div class="form-group">
                                            <label for="#">Kelas</label>
                                            <input type="text" class="form-control" disabled
                                                value="{{ $waliKelas->nama_jurusan }} | {{ $waliKelas->nama_kelas }}"
                                                required>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12">
                                        <div class="form-group">
                                            <label for="#">Wali Kelas</label>
                                            <select name="guru_id" id="guru_id" class="form-control select2" required
                                                required>
                                                @foreach ($gurus as $guru)
                                                    <option value="{{ $guru->guru_id }}" @selected($waliKelas->guru_id == $guru->guru_id)>
                                                        {{ $guru->nama }}</option>
                                                @endforeach
                                            </select>
                                            @error('guru_id')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
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

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Wali kelas berhasil di update",
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

        @if (session()->has('guru_is_waliKelas'))
            Swal.fire({
                title: "{{ session('guru_is_waliKelas') }}",
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
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $(".select2").select2({
            theme: "bootstrap4",
            width: "100%",
        })
    </script>
@endsection

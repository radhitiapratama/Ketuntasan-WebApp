@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Siswa</h1>
                    <a href="/siswa" class="btn-dark">
                        <i class="fa-solid fa-arrow-left"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row my-2">
        <div class="col-12">
            <div class="alert-box alert-warning">
                <div class="alert-icon">
                    <i class="ri-error-warning-line"></i>
                </div>
                <div class="alert-body">
                    <p class="alert-title">Peringatan !</p>
                    <p class="alert-text">
                        Jika anda mengubah data tingkatan / kelas siswa maka semua data ketuntasannya di tahun ajaran yang
                        aktif akan terhapus!
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form action="/siswa/update" method="post" id="form">
                                @csrf
                                <input type="hidden" name="siswa_id" value="{{ $siswa->siswa_id }}">
                                <input type="hidden" name="hide_tingkatan" value="{{ $siswa->tingkatan }}">
                                <input type="hidden" name="hide_jurusan" value="{{ $siswa->jurusan_id }}">
                                <input type="hidden" name="hide_kelas" value="{{ $siswa->kelas_id }}">

                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="#">Tingkatan</label>
                                            <select name="tingkatan" id="tingkatan" class="form-control" required>
                                                @foreach ($tingkatans as $key => $value)
                                                    <option value="{{ $key }}" @selected(old('tingkatan', $siswa->tingkatan) == $key)>
                                                        {{ $value }}</option>
                                                @endforeach
                                            </select>
                                            @error('tingkatan')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="#">Kelas</label>
                                            <select name="kelas_id" id="kelas_id" class="form-control" required>
                                                @foreach ($kelases as $kelas)
                                                    <option
                                                        value="{{ $kelas->jurusan->jurusan_id }}|{{ $kelas->kelas_id }}"
                                                        @selected(old('kelas_id', $siswa->jurusan_id . '|' . $siswa->kelas_id) == $kelas->jurusan->jurusan_id . '|' . $kelas->kelas_id)>
                                                        {{ $kelas->jurusan->nama_jurusan }} | {{ $kelas->nama_kelas }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('kelas_id')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="#">Username</label>
                                            <input type="text" class="form-control" name="username"
                                                value="{{ old('username', $siswa->username) }}"required>
                                            @error('username')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="#">Nama Siswa</label>
                                            <input type="text" class="form-control" name="nama"
                                                value="{{ old('nama', $siswa->nama) }}"required>
                                            @error('nama')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="#">Status</label>
                                            <select name="status" id="status" class="form-control" required>
                                                @foreach ($statuses as $key => $value)
                                                    <option value="{{ $key }}" @selected(old('status', $siswa->status) == $key)>
                                                        {{ $value }}</option>
                                                @endforeach
                                            </select>
                                            @error('status')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <button type="submit" class="btn-dark" id="btn-submit">
                                            <i class="ri-check-line"></i>
                                            Update
                                        </button>
                                    </div>
                                </div>
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
        @if (session()->has('duplicate_username'))
            Swal.fire({
                title: "Gagal username sudah di gunakan",
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

        @if (session()->has('failed_update'))
            Swal.fire({
                title: "{{ session('failed_update') }}",
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

        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Siswa berhasil di update",
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
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        };

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $("#tingkatan").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);
        $("#status").select2(configSelect2);

        $("#btn-submit").click(function(e) {
            e.preventDefault();
            const hide_tingkatan = $("input[name='hide_tingkatan']").val();
            const hide_jurusan = $("input[name='hide_jurusan']").val();
            const hide_kelas = $("input[name='hide_kelas']").val();

            const tingkatan = $("#tingkatan").val();

            // [0] => jurusan_id
            // [1] => kelas_id
            const arrKelas = $("#kelas_id").val().split("|");

            if (hide_tingkatan != tingkatan || hide_jurusan != arrKelas[0] || hide_kelas != arrKelas[1]) {
                Swal.fire({
                    title: 'Peringatan',
                    text: "Jika anda mengubah Tingkatan/Kelas siswa semua data ketuntasan siswa di tahun ajaran yang aktif akan terhapus,apakah anda yakin?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Iya,Update !',
                    cancelButtonText: "Batal !",
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#form").submit();
                    }
                })

                return;
            }

            Swal.fire({
                title: 'Peringatan',
                text: "Apakah anda yakin ingin mengupdate data siswa?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya,Update !',
                cancelButtonText: "Batal !",
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#form").submit();
                }
            })

        });
    </script>
@endsection

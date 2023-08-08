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
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-10 col-12">
                    <form action="/siswa/update" method="post" id="form">
                        @csrf
                        <input type="hidden" name="user_id" value="{{ $siswa->user_id }}">
                        <input type="hidden" name="hide_tingkatan" value="{{ $siswa->tingkatan }}">
                        <input type="hidden" name="hide_jurusan" value="{{ $siswa->jurusan_id }}">
                        <input type="hidden" name="hide_kelas" value="{{ $siswa->kelas_id }}">

                        <div class="row">
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Tingkatan</label>
                                    <select name="tingkatan_id" id="tingkatan" class="form-control" required>
                                        <option value=""></option>
                                        @foreach ($tingkatans as $key => $value)
                                            <option value="{{ $key }}" @selected($key == $siswa->tingkatan)>
                                                {{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Jurusan</label>
                                    <select name="jurusan_id" id="jurusan" class="form-control" required>
                                        <option value=""></option>
                                        @foreach ($jurusans as $jurusan)
                                            <option value="{{ $jurusan->jurusan_id }}" @selected($siswa->jurusan_id == $jurusan->jurusan_id)>
                                                {{ $jurusan->nama_jurusan }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Kelas</label>
                                    <select name="kelas_id" id="kelas" class="form-control" required>

                                        @php
                                            $sql_kelases = DB::table('kelas')
                                                ->select('kelas_id', 'nama_kelas')
                                                ->where('jurusan_id', $siswa->jurusan_id)
                                                ->get();
                                        @endphp

                                        @foreach ($sql_kelases as $kelases)
                                            <option value="{{ $kelases->kelas_id }}" @selected($kelases->kelas_id == $siswa->kelas_id)>
                                                {{ $kelases->nama_kelas }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Username</label>
                                    @if (old('username'))
                                        <input type="text" class="form-control" name="username"
                                            value="{{ old('username') }}"required>
                                    @else
                                        <input type="text" class="form-control" name="username"
                                            value="{{ $siswa->username }}"required>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Nama Siswa</label>
                                    @if (old('nama'))
                                        <input type="text" class="form-control" name="nama"
                                            value="{{ old('nama') }}"required>
                                    @else
                                        <input type="text" class="form-control" name="nama"
                                            value="{{ $siswa->nama }}"required>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Status</label>
                                    <select name="status" id="status" class="form-control" required>
                                        @foreach ($statuses as $key => $value)
                                            <option value="{{ $key }}" @selected($key == $siswa->status)>
                                                {{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn-dark m-auto" id="btn-submit">
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
            placeholder: "Pilih...",
        };

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        $("#tingkatan").select2(configSelect2);
        $("#jurusan").select2(configSelect2);
        $("#kelas").select2(configSelect2);
        $("#status").select2(configSelect2);

        $("#btn-submit").click(function(e) {
            e.preventDefault();
            const hide_tingkatan = $("input[name='hide_tingkatan']").val();
            const hide_jurusan = $("input[name='hide_jurusan']").val();
            const hide_kelas = $("input[name='hide_kelas']").val();

            const tingkatan = $("#tingkatan").val();
            const jurusan = $("#jurusan").val();
            const kelas = $("#kelas").val();

            if (hide_tingkatan != tingkatan || hide_jurusan != jurusan || hide_kelas != kelas) {
                Swal.fire({
                    title: 'Peringatan',
                    text: "Mengubah tingkatan / jurusan / kelas akan berdampak buruk pada akun siswa ketika akan naik kelas ! apakah anda yakin ingin melakukan perubahannya ?",
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
            }

            Swal.fire({
                title: 'Peringatan',
                text: "Mengubah data siswa yang sudah ditambahkan sangatlah berbahaya kepada data siswa tersebut,apakah anda yakin ingin melakukan perubahan ?",
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

        $("#jurusan").change(function() {
            $("#kelas").html("");
            $("#kelas").attr("disabled", true);

            $.ajax({
                type: "POST",
                url: "/getDataKelasByJurusan",
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                data: {
                    jurusan_id: $(this).val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    let opt = `<option value=""></option>`;

                    for (let i = 0; i < response.kelases.length; i++) {
                        opt +=
                            `<option value="${response.kelases[i].kelas_id}">${response.kelases[i].nama_kelas}</option>`;
                    }

                    console.log(opt);
                    $("#kelas").html(opt);
                    $("#kelas").attr("disabled", false);
                }
            });
        });
    </script>
@endsection

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
                    <h1 class="page-title">Tambah Data Ketuntasan</h1>
                    <a href="/ketuntasan" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row justify-content-center mb-3">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        <select name="tingkatan_id" id="tingkatan_id" class="form-control select2">
                            <option value=""></option>
                            @foreach ($tingkatans as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <select name="jurusan_id" id="jurusan_id" class="form-control select2">
                            <option value=""></option>
                            @foreach ($jurusans as $jurusan)
                                <option value="{{ $jurusan->jurusan_id }}">{{ $jurusan->nama_jurusan }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Kelas</label>
                        <select name="kelas_id" id="kelas_id" class="form-control select2" disabled>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <button type="button" class="btn-dark" id="btn-submit">
                        <i class="ri-check-line"></i>
                        Submit
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        }

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        $("#tingkatan_id").select2(configSelect2);
        $("#jurusan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);

        $("#tingkatan_id").change(function() {
            $("#jurusan_id").attr("disabled", false);
        });

        $("#jurusan_id").change(function() {
            $("#kelas_id").html("");
            $("#kelas_id").attr("disabled", true);
            $.ajax({
                type: "POST",
                url: "/getDataKelasByJurusan",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    jurusan_id: $(this).val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    let opt = '<option value=""></option>';
                    for (let i = 0; i < response.kelases.length; i++) {
                        opt +=
                            `<option value="${response.kelases[i].kelas_id}">${response.kelases[i].nama_kelas}</option>`;
                    }
                    $("#kelas_id").html(opt);
                    $("#kelas_id").attr("disabled", false);
                }
            });
        });

        $("#kelas_id").change(function() {
            $("input[name='username']").attr("disabled", false);
            $("input[name='password']").attr("disabled", false);
            $("input[name='nama_siswa']").attr("disabled", false);
        });

        $("#btn-submit").click(function() {
            const tingkatan = $("#tingkatan_id").val();
            const jurusan = $("#jurusan_id").val();
            const kelas = $("#kelas_id").val();

            if (tingkatan == "" || tingkatan == null || jurusan == "" || jurusan == null || kelas == "" || kelas ==
                null) {
                Swal.fire({
                    title: "Gagal !",
                    text: "Semua input wajib di isi",
                    icon: "error",
                });
                return;
            }

            Swal.fire({
                title: "Memprosess...",
                text: "Sedang memproses,silahkan tunggu beberapa menit,Jangan close Browser / Tekan tombol back ! Tunggu Sampai prosess selesaii",
                icon: "info",
                showConfirmButton: false,
                allowOutsideClick: false
            });

            $.ajax({
                type: "POST",
                url: "/ketuntasan/store",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    tingkatan_id: $("#tingkatan_id").val(),
                    jurusan_id: $("#jurusan_id").val(),
                    kelas_id: $("#kelas_id").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    Swal.close();
                    if (response.message == "success") {
                        Swal.fire({
                            title: "Berhasil",
                            text: "Data Ketuntasan berhasil di buat",
                            icon: "success",
                        });

                        $("#tingkatan_id").val("").trigger("change.select2");
                        $("#jurusan_id").val("").trigger("change.select2");
                        $("#kelas_id").val("").trigger("change.select2");
                        return;
                    }

                    if (response.message == "empty_mapel") {
                        Swal.fire({
                            title: "Gagal !",
                            text: "Kelas tidak punya mapel !",
                            icon: "error",
                        });
                        return;
                    }

                    if (response.message == 'empty_siswa') {
                        Swal.fire({
                            title: "Gagal !",
                            text: "Tidak ada data siswa di kelas yang di pilih !",
                            icon: "error",
                        });
                        return;
                    }
                }
            });
        });
    </script>
@endsection

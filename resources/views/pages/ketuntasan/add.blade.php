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
    <div class="row">
        <div class="col-md-8 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 col-12">
                            <div class="form-group">
                                <label for="#">Tingkatan</label>
                                <select name="tingkatan_id" id="tingkatan_id" class="form-control select2">
                                    <option value="">Pilih...</option>
                                    @foreach ($tingkatans as $key => $value)
                                        <option value="{{ $key }}">{{ $value }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label for="#">Kelas</label>
                                <select name="kelas_id" id="kelas_id" class="form-control select2">
                                    <option value="">Pilih...</option>
                                    @foreach ($kelases as $kelas)
                                        <option value="{{ $kelas->jurusan->jurusan_id }}|{{ $kelas->kelas_id }}">
                                            {{ $kelas->jurusan->nama_jurusan }} | {{ $kelas->nama_kelas }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-12">
                            <div class="form-group">
                                <label for="#">Semester</label>
                                <select name="semester" id="semester" class="form-control">
                                    <option value="">Pilih...</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                    </div>
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
        }

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        $("#tingkatan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);
        $("#semester").select2(configSelect2);

        $("#btn-submit").click(function() {
            const tingkatan = $("#tingkatan_id").val();
            const kelas = $("#kelas_id").val();
            const semester = $("#semester").val();

            if (tingkatan == "" || tingkatan == null || kelas == "" || kelas ==
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
                    kelas_id: $("#kelas_id").val(),
                    semester: $("#semester").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    Swal.close();

                    if (response.message == "empty_batasWaktu") {
                        swal.fire({
                            title: "Gagal",
                            text: "Silahkan tambahkan batas waktu terlebih dahulu !",
                            icon: "warning",
                        });

                        return;
                    }

                    if (response.message == "success") {
                        Swal.fire({
                            title: "Data ketuntasan berhasil di buat",
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

                        $("#tingkatan_id").val("").trigger("change.select2");
                        $("#jurusan_id").val("").trigger("change.select2");
                        $("#kelas_id").val("").trigger("change.select2");
                        $("#semester").val("").trigger("change.select2");
                        return;
                    }

                    if (response.message == "empty_mapel") {
                        Swal.fire({
                            title: "Gagal kelas tidak punya mapel",
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
                        return;
                    }

                    if (response.message == 'empty_siswa') {
                        Swal.fire({
                            title: "Gagal tidak ada data siswa di kelas yg di pilih",
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
                        return;
                    }
                }
            });
        });
    </script>
@endsection

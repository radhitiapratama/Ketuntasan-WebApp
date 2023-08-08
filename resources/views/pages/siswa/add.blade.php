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
                    <h1 class="page-title">Tambah Siswa</h1>
                    <a href="/siswa" class="btn-dark">
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
                <div class="col-12 col-md-8">
                    <form id="form">
                        <div class="row justify-content-center mb-3">
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Tingkatan</label>
                                    <select name="tingkatan" id="tingkatan_id" class="form-control select2" required>
                                        <option value=""></option>
                                        @foreach ($tingkatans as $key => $value)
                                            <option value="{{ $key }}">
                                                {{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Jurusan</label>
                                    <select name="jurusan_id" id="jurusan_id" class="form-control select2" disabled
                                        required>
                                        <option value=""></option>
                                        @foreach ($jurusans as $jurusan)
                                            <option value="{{ $jurusan->jurusan_id }}">{{ $jurusan->nama_jurusan }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Kelas</label>
                                    <select name="kelas_id" id="kelas_id" class="form-control select2" disabled required>
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Username</label>
                                    <input type="text" class="form-control" id="username" name="username"
                                        placeholder="Contoh : jonokurnia123" disabled required>
                                    <small class="text-danger" id="err-username"></small>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Password</label>
                                    <div class="input-group">
                                        <input type="password" id="password" class="form-control input-pass"
                                            name="password" disabled required>
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="show-pass">
                                                <i class="ri-eye-line"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <small class="text-danger" id="err-password"></small>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="#">Nama Siswa</label>
                                    <input type="text" id="nama_siswa" class="form-control" name="nama_siswa"
                                        placeholder="Contoh : Jono Kurniawan" disabled required>
                                    <small class="text-danger" id="err-nama_siswa"></small>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="btn-submit" class="btn-dark m-auto">
                            <i class="ri-check-line"></i>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Siswa berhasil di tambahkan",
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
        function showLoading() {
            Swal.fire({
                title: "Sedang memprosess,",
                text: "Jangan tutup Browser / tekan tombol kembali",
                icon: "info",
                showConfirmButton: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
        }

        function hideLoading() {
            Swal.close();
        }

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        }

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        const showPass = $("#show-pass");
        const inputPass = $(".input-pass");

        showPass.click(function() {
            if (inputPass.attr("type") == "text") {
                inputPass.attr("type", "password");
            } else {
                inputPass.attr("type", 'text');
            }
        });

        $("#tingkatan_id").select2(configSelect2);
        $("#jurusan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);
        $("#user_id").select2(configSelect2);

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
            showLoading();
            const formData = $("#form").serialize();

            $.ajax({
                type: "POST",
                url: "{{ url('siswa/store') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: formData,
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    hideLoading();
                    if (response.message == "failed") {
                        for (const prop in response.error) {
                            $(`#err-${prop}`).text(response.error[prop][0]);
                        }

                        Swal.fire({
                            title: "Gagal menambahkan siswa",
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

                    $("#username").attr("disabled", true);
                    $("#username").val("");
                    $("#nama_siswa").attr("disabled", true);
                    $("#nama_siswa").val("");
                    $("#password").attr("disabled", true).val("");
                    $("#password").val("");

                    $("#tingkatan_id").val("").trigger("change.select2");
                    $("#jurusan_id").val("").trigger("change.select2");
                    $("#jurusan_id").attr('disabled', true);
                    $("#kelas_id").val("").trigger("change.select2");
                    $("#kelas_id").attr("disabled", true);
                    $("#kelas_id").html("");

                    Swal.fire({
                        title: "Siswa berhasil di tambahkan",
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

                }
            });
        });
    </script>
@endsection

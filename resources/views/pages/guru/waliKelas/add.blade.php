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
                    <h1 class="page-title">Tambah Wali Kelas</h1>
                    <a href="/wali-kelas" class="btn-dark">
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
                <div class="col-12">
                    <form action="/wali-kelas/store" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-2 col-12">
                                <div class="form-group">
                                    <label for="#">Tingkatan</label>
                                    <select name="tingkatan_id" id="tingkatan" class="form-control" required>
                                        <option value=""></option>
                                        @foreach ($tingkatans as $key => $value)
                                            <option value="{{ $key }}">{{ $value }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 col-12">
                                <div class="form-group">
                                    <label for="#">Jurusan</label>
                                    <select name="jurusan_id" id="jurusan" class="form-control" disabled required>
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
                                    <select name="kelas_id" id="kelas" class="form-control" disabled required>
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Wali Kelas</label>
                                    <select name="user_id" id="guru" class="form-control" disabled required>
                                        <option value=""></option>
                                        @foreach ($gurus as $guru)
                                            <option value="{{ $guru->user_id }}">{{ $guru->nama }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn-dark m-auto">
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
        @if (session()->has('failed'))
            Swal.fire({
                title: "Gagal kelas sudah punya wali kelas",
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

        @if (session()->has('successStore'))
            Swal.fire({
                title: "Wali kelas berhasil di tambahkan",
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

        const csrfToken = $('meta[name="csrf-token"]').attr("content");

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        }

        $("#tingkatan").select2(configSelect2);
        $("#jurusan").select2(configSelect2);
        $("#kelas").select2(configSelect2);
        $("#guru").select2(configSelect2);

        $("#tingkatan").change(function() {
            $("#jurusan").attr("disabled", false);
        });

        $("#jurusan").change(function() {
            $.ajax({
                type: "POST",
                url: "/getDataKelasByJurusan",
                headers: {
                    "X-CSRF-TOKEN": csrfToken,
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

                    $("#kelas").html(opt);
                    $("#kelas").attr('disabled', false);
                }
            });
        });

        $("#kelas").change(function() {
            $("#guru").attr("disabled", false);
        });
    </script>
@endsection

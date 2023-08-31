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
                    <h1 class="page-title">Edit Ketuntasan</h1>
                    <form action="{{ url('ketuntasan/siswas/show') }}" method="post">
                        @csrf
                        <input type="hidden" name="tingkatan" value="{{ $tingkatan }}">
                        <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                        <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                        <input type="hidden" name="user_id" value="{{ $user_id }}">
                        <button type="submit" class="btn-dark">
                            <i class="ri-arrow-left-line"></i>
                            Kembali
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form action="" method="POST">
                                <input type="hidden" name="ketuntasan_id" value="{{ $ketuntasan->ketuntasan_id }}">
                                <input type="hidden" name="tingkatan" value="{{ $tingkatan }}">
                                <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                                <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                                <input type="hidden" name="user_id" value="{{ $user_id }}">

                                <div class="form-group">
                                    <label for="#">Siswa</label>
                                    <input type="text" class="form-control" id="siswa"
                                        value="{{ $ketuntasan->nama }}" disabled required>
                                </div>
                                <div class="form-group">
                                    <label for="#">Status</label>
                                    <select name="tuntas" id="tuntas" class="form-control select2" required>
                                        @foreach ($tuntases as $key => $value)
                                            <option value="{{ $key }}" @selected($key == $ketuntasan->tuntas)>
                                                {{ $value }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="#">Deskripsi</label>
                                    <textarea name="deskripsi" id="deskripsi" class="form-control">{{ $ketuntasan->desc }}</textarea>
                                </div>
                                @if ($status_batasWaktu == 'dalamBatasWaktu')
                                    <button type="button" class="btn-dark" id="btn-edit">
                                        <i class="ri-check-line"></i>
                                        Update
                                    </button>
                                @elseif($status_batasWaktu == 'kurang')
                                    <button type="button" class="btn-dark" id="btn-edit">
                                        <i class="ri-close-circle-line"></i>
                                        Kurang dari batas waktu
                                    </button>
                                @elseif ($status_batasWaktu == 'lebih')
                                    <button type="button" class="btn-dark" id="btn-edit">
                                        <i class="ri-close-circle-line"></i>
                                        Lebih dari batas waktu
                                    </button>
                                @endif

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
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });


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

        $("#tuntas").select2({
            theme: "bootstrap4",
            width: "100%",
        });

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        @if ($status_batasWaktu == 'dalamBatasWaktu')
            $("#btn-edit").click(function() {
                showLoading();
                $.ajax({
                    type: "POST",
                    url: "{{ url('ketuntasan/update') }}",
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    data: {
                        ketuntasan_id: {{ $ketuntasan->ketuntasan_id }},
                        tuntas: $("#tuntas").val(),
                        deskripsi: $("#deskripsi").val(),
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response.message == 'success') {
                            hideLoading();
                            Swal.fire({
                                title: "Ketuntasan siswa berhasil di update",
                                icon: "success",
                                iconColor: 'white',
                                customClass: {
                                    popup: 'colored-toast'
                                },
                                toast: true,
                                position: 'top-right',
                                showConfirmButton: false,
                                timer: 4000,
                                timerProgressBar: true
                            });

                            let text = "";
                            let value = "";
                            if (response.ketuntasan.tuntas == 1) {
                                text = "Tuntas";
                                value = 1;
                            } else {
                                text = "Belum Tuntas";
                                value = 0;
                            }
                            $("select[name='status']").val(value).trigger("change");
                            $("#deskripsi").val(response.ketuntasan.desc);
                        }
                    }
                });
            });
        @endif
    </script>
@endsection

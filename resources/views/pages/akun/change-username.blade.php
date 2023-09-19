@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Ganti Username</h1>
                    <a href="{{ url('akun') }}" class="btn-dark">
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
                    <div class="form-group">
                        <div class="form-group">
                            <label for="#">Username</label>
                            <input type="text" class="form-control newUsername" name="newUsername"
                                placeholder="Masukkan Username yang baru">
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn-dark btn-change">
                                <i class="ri-check-line"></i>
                                Ganti
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");

        @if (Auth::guard('admin')->check())
            const dataSend = {
                adminId: {{ Auth::guard('admin')->user()->admin_id }},
            }
        @endif

        @if (Auth::guard('guru')->check())
            const dataSend = {
                guruId: {{ Auth::guard('guru')->user()->guru_id }},
            }
        @endif

        @if (Auth::guard('siswa')->check())
            const dataSend = {
                siswaId: {{ Auth::guard('siswa')->user()->siswa_id }},
            }
        @endif

        function validation() {
            const inputUsername = $("input[name='newUsername']").val();
            if (inputUsername.length <= 0) {
                Swal.fire({
                    title: "Username wajib di isi",
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
                return false;
            }

            return true;
        }

        function changeUsername() {
            const checkValidation = validation();

            if (!checkValidation) return;

            Swal.fire({
                title: 'Peringatan !',
                text: "Apakah anda yakin ingin mengganti username ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya',
                cancelButtonText: "Batal",
            }).then((result) => {
                if (result.isConfirmed) {
                    dataSend.newUsername = $(".newUsername").val();
                    $.ajax({
                        type: "POST",
                        url: "{{ url('akun/change-username') }}",
                        headers: {
                            'X-CSRF-TOKEN': csrfToken,
                        },
                        data: dataSend,
                        dataType: "json",
                        success: function(response) {
                            if (response.status == false) {
                                Swal.fire({
                                    title: "Username sudah di gunakan",
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

                            Swal.fire({
                                title: "Username berhasil di ganti",
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

                            $(".newUsername").val("");
                        }
                    });
                }
            });
        }

        $(".btn-change").click(function() {
            changeUsername();
        });

        $(".newUsername").keypress(function(e) {
            if (e.which == 13) {
                changeUsername();
            }
        });
    </script>
@endsection

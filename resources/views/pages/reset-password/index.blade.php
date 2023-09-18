@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="row">
        <div class="col-md-5 col-12">
            <div class="card">
                <div class="card-body d-flex" style="gap: 15px">
                    <input type="text" class="form-control input-username" placeholder="Masukkan Username...">
                    <button type="button" class="btn-dark btn-cari">
                        <i class="ri-search-line"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="col-md-7 col-12 account-info-container">
        </div>
    </div>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const accountInfoContainer = $('.account-info-container');

        $(document).on("click", ".password-icon", function() {
            const inputPassword = $(".input-password");
            if (inputPassword.attr("type") == "text") {
                inputPassword.attr("type", "password");
                $(this).html(`<i class="ri-eye-off-line"></i>`);
            } else {
                inputPassword.attr("type", 'text');
                $(this).html(`<i class="ri-eye-line"></i>`);
            }
        });

        $(document).on('click', '.btn-admin.btn-ganti-password', function() {
            const validation = validationNewInputPassword();

            if (!validation) return;

            Swal.fire({
                title: 'Peringatan !',
                text: "Apakah anda yakin ingin mengubah password ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya',
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "reset-password",
                        headers: {
                            'X-CSRF-TOKEN': csrfToken,
                        },
                        data: {
                            role: $("input[name='role']").val(),
                            adminId: $("input[name='admin_id']").val(),
                            newPassword: $("input[name='new-password']").val()
                        },
                        dataType: "json",
                        success: function(response) {
                            $(".account-info-container").html("");
                            $(".input-username").val("");
                            Swal.fire({
                                title: "Password berhasil di ubah !",
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
                }
            })
        });

        $(document).on('click', '.btn-guru.btn-ganti-password', function() {
            const validation = validationNewInputPassword();

            if (!validation) return;

            Swal.fire({
                title: 'Peringatan !',
                text: "Apakah anda yakin ingin mengubah password ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya',
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "reset-password",
                        headers: {
                            'X-CSRF-TOKEN': csrfToken,
                        },
                        data: {
                            role: $("input[name='role']").val(),
                            guruId: $("input[name='guruId']").val(),
                            newPassword: $("input[name='new-password']").val()
                        },
                        dataType: "json",
                        success: function(response) {
                            $(".account-info-container").html("");
                            $(".input-username").val("");
                            Swal.fire({
                                title: "Password berhasil di ubah !",
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
                }
            })
        });

        $(document).on('click', '.btn-siswa.btn-ganti-password', function() {
            const validation = validationNewInputPassword();

            if (!validation) return;

            Swal.fire({
                title: 'Peringatan !',
                text: "Apakah anda yakin ingin mengubah password ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya',
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "reset-password",
                        headers: {
                            'X-CSRF-TOKEN': csrfToken,
                        },
                        data: {
                            role: $("input[name='role']").val(),
                            siswaId: $("input[name='siswaId']").val(),
                            newPassword: $("input[name='new-password']").val()
                        },
                        dataType: "json",
                        success: function(response) {
                            $(".account-info-container").html("");
                            $(".input-username").val("");
                            Swal.fire({
                                title: "Password berhasil di ubah !",
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
                }
            })
        });

        function validationNewInputPassword() {
            const inputPassword = $(".input-password").val();
            if (inputPassword.length <= 0) {
                Swal.fire({
                    title: "Password Baru wajib di isi",
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

        function seachUsername() {
            $.ajax({
                type: "POST",
                url: "{{ url('getDataAccountByUsername') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    username: $(".input-username").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response)

                    if (response.status == false) {
                        Swal.fire({
                            title: "Data tidak ditemukan !",
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

                    if (response.role == 1) {
                        const html = `
                        <div class="my-card">
                            <div class="card-icon">
                                <i class="ri-user-line"></i>
                            </div>
                            <form>
                                <input type="hidden" name="role" value="${response.role}">
                                <input type="hidden" name="admin_id" value="${response.admin_id}">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="#">Username</label>
                                            <input  type="text" class="form-control pointer-none" value="${response.username}" tabindex="-1">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="#">Nama</label>
                                            <input type="text" class="form-control pointer-none" value="${response.nama}" tabindex="-1">
                                        </div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="#">Password Baru</label>
                                        <div class="input-group flex-nowrap">
                                            <input type="password" class="form-control input-password" name='new-password' autocomplete="off" minlength="6">
                                            <div class="input-group-prepend ">
                                                <span class="input-group-text password-icon" id="addon-wrapping">
                                                    <i class="ri-eye-off-line"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn-dark btn-admin btn-ganti-password">
                                            <i class="ri-check-line"></i>
                                            Ganti Password
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        `;

                        accountInfoContainer.html(html);

                        return;
                    }

                    if (response.role == 2) {
                        const html = `
                        <div class="my-card">
                            <div class="card-icon">
                                <i class="ri-user-line"></i>
                            </div>
                            <form>
                                <input type="hidden" name="role" value="${response.role}">
                                <input type="hidden" name="guruId" value="${response.guru_id}">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="#">Username</label>
                                            <input type="text" class="form-control pointer-none" value="${response.username}">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="#">Nama</label>
                                            <input type="text" class="form-control pointer-none" value="${response.username}">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="#">Kode Guru</label>
                                            <input type="text" class="form-control pointer-none" value="${response.kode_guru}">
                                        </div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="#">Password Baru</label>
                                        <div class="input-group flex-nowrap">
                                            <input type="password" class="form-control input-password" name='new-password' autocomplete="off" minlength="6">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text password-icon" id="addon-wrapping">
                                                    <i class="ri-eye-off-line"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn-dark btn-guru btn-ganti-password">
                                            <i class="ri-check-line"></i>
                                            Ganti Password
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        `;

                        accountInfoContainer.html(html);
                        return;
                    }

                    if (response.role == 3) {
                        let tingkatan;

                        if (response.tingkatan == 1) {
                            tingkatan = "X";
                        }

                        if (response.tingkatan == 2) {
                            tingkatan = "XI";
                        }

                        if (response.tingkatan == 3) {
                            tingkatan = "XII";
                        }


                        const html = `
                        <div class="my-card">
                            <div class="card-icon">
                                <i class="ri-user-line"></i>
                            </div>
                            <form>
                                <input type="hidden" name="role" value="${response.role}">
                                <input type="hidden" name="siswaId" value="${response.siswa_id}">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="#">Tingkatan</label>
                                            <input type="text" class="form-control pointer-none"  value="${tingkatan}">
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="form-group">
                                            <label for="#">Kelas</label>
                                            <input type="text" class="form-control pointer-none" value="${response.nama_jurusan} | ${response.nama_kelas}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="#">Username</label>
                                            <input type="text" class="form-control pointer-none" value="${response.username}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="#">Nama</label>
                                            <input type="text" class="form-control pointer-none" value="${response.nama}">
                                        </div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="#">Password Baru</label>
                                        <div class="input-group flex-nowrap">
                                            <input type="password" class="form-control input-password" name='new-password' autocomplete="off" minlength="6">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text password-icon" id="addon-wrapping ">
                                                    <i class="ri-eye-off-line"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn-dark btn-siswa btn-ganti-password">
                                            <i class="ri-check-line"></i>
                                            Ganti Password
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        `;

                        accountInfoContainer.html(html);

                        return;
                    }
                }
            });
        }

        $(".btn-cari").click(function() {
            seachUsername();
        });

        $(".input-username").keypress(function(e) {
            if (e.which == 13) {
                seachUsername();
            }
        });
    </script>
@endsection

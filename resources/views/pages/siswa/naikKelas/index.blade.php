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
                    <h1 class="page-title">Siswa Naik Kelas</h1>

                </div>
            </div>
        </div>
    </div>
    <div class="row my-1">
        <div class="col-12">
            <div class="alert-box alert-warning">
                <div class="alert-icon">
                    <i class="ri-error-warning-line"></i>
                </div>
                <div class="alert-body">
                    <p class="alert-title">Peringatan !</p>
                    <p class="alert-text">
                        Untuk menaikkan siswa ke tingkatan berikutnya,wajib di mulai dari tingkatan XII supaya data siswa
                        yang
                        belum di naikkan tidak tercampur dengan data siswa yang sudah di naikkan ke tingkatan selanjutnya
                    </p>
                </div>
            </div>
        </div>
    </div>

    <form action="/siswa/naik-kelas/do" method="post" id="form">
        @csrf
        <div class="card">
            <div class="card-header">
                <button type="button" class="btn-dark" id="btn-naik-kelas">
                    <i class="ri-check-line"></i>
                    Naik Kelas
                </button>
            </div>
            <div class="card-header">
                <div class="row">
                    <div class="col-md-2 col-12">
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
                            <label for="#">Kelas</label>
                            <select name="kelas_id" id="kelas_id" class="form-control select2">
                                <option value=""></option>
                                @foreach ($kelases as $kelas)
                                    <option value="{{ $kelas->jurusan_id }}|{{ $kelas->kelas_id }}">
                                        {{ $kelas->nama_jurusan }} | {{ $kelas->nama_kelas }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-bordered" id="tbl-siswa" style="width: 100%">
                            <thead>
                                <tr>
                                    <th class="vertical-align-middle" width="5px">#</th>
                                    <th width="5px" class="text-center vertical-align-middle"><input type="checkbox"
                                            name="check_all" id="check_all"></th>
                                    <th class="vertical-align-middle">Username</th>
                                    <th class="vertical-align-middle">Nama Siswa</th>
                                    <th width="5px" class="text-center vertical-align-middle">Tingkatan</th>
                                    <th class="vertical-align-middle">Kelas</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        @if (session()->has('successNaikKelas'))
            Swal.fire({
                title: "Siswa berhasil di naikkan",
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
        function loadDatatable() {
            $("#tbl-siswa").DataTable({
                paging: false,
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                ajax: {
                    url: "{{ url('siswa/naik-kelas') }}",
                    data: function(data) {
                        data.tingkatan = $("#tingkatan_id").val();
                        data.kelas_id = $("#kelas_id").val();
                    }
                },
                drawCallback: function(res) {
                    console.log(res.json);
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "checkbox"
                    },
                    {
                        data: "username"
                    },
                    {
                        data: "nama"
                    },
                    {
                        data: "tingkatan"
                    },
                    {
                        data: "kelas"
                    },
                ]
            });
        }

        function clearDatatable() {
            $("#tbl-siswa").DataTable().clear().destroy();
        }

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        const configSelect2 = {
            theme: 'bootstrap4',
            width: "100%",
            placeholder: "Pilih..."
        }

        $("#tingkatan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);

        //change tingkatan
        $("#tingkatan_id").change(function() {
            const jurusan = $("#jurusan_id").val();
            const kelas = $("#kelas_id").val();
            if (jurusan != "" && kelas != "") {
                clearDatatable();
                loadDatatable();
            }
        });

        //filter kelas
        $("#kelas_id").change(function() {
            clearDatatable();
            loadDatatable();
        });

        //checkall checkbox
        $("#check_all").click(function() {
            $("input[name='check_siswa_id[]']").prop("checked", this.checked);
        });

        //naik kelas
        $("#btn-naik-kelas").click(function() {
            const chekedLength = $("input[name='check_siswa_id[]']:checked").length;
            if (chekedLength <= 0) {
                Swal.fire({
                    title: "Minimal ada 1 siswa yang di naikkan",
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
                title: 'Peringatan !',
                text: "Apakah anda yakin ingin menaikkan siswa berikut ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Iya,Naikkan',
                cancelButtonText: "Batal",
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#form").submit();
                }
            })

        });
    </script>
@endsection

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
                    <button type="button" class="btn-dark" id="btn-naik-kelas">
                        <i class="ri-check-line"></i>
                        Naik Kelas
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-1">
        <div class="card-body">
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
        </div>
    </div>

    <form action="/siswa/do-naik-kelas" method="post" id="form">
        @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-bordered" id="tbl-siswa" style="width: 100%">
                            <thead>
                                <tr>
                                    <th style="width: 5px">#</th>
                                    <th class="text-center"><input type="checkbox" name="check_all" id="check_all"></th>
                                    <th>Username</th>
                                    <th>Nama Siswa</th>
                                    <th>Tingkatan</th>
                                    <th>Jurusan</th>
                                    <th>Kelas</th>
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
                title: "Suksess",
                text: "Siswa berhasil di naikkan",
                icon: "success",
            });
        @endif
    </script>

    <script>
        function loadDatatable() {
            $("#tbl-siswa").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('getDataSiswaNaikKelas') }}",
                    data: function(data) {
                        data.tingkatan = $("#tingkatan_id").val();
                        data.jurusan_id = $("#jurusan_id").val();
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
                        data: "jurusan"
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
        $("#jurusan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);

        //change tingkatan
        $("#tingkatan_id").change(function() {
            const jurusan = $("#jurusan_id").val();
            const kelas = $("#kelas_id").val();
            if (jurusan != null && kelas != null) {
                clearDatatable();
                loadDatatable();
            }
        });

        //change jurusan
        $("#jurusan_id").change(function() {
            $("#kelas_id").attr("disabled", true);
            $("#kelas_id").html("");

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
                    let opt = "<option value=''></option>";
                    for (let i = 0; i < response.kelases.length; i++) {
                        opt +=
                            `<option value="${response.kelases[i].kelas_id}">${response.kelases[i].nama_kelas}</option>`;
                    }

                    $("#kelas_id").html(opt);
                    $("#kelas_id").attr("disabled", false);
                }
            });
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
                    title: "Gagal !",
                    text: "Minimal ada 1 siswa yang ingin di naikkan kelasnya !",
                    icon: "error",
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

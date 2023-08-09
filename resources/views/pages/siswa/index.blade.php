@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Siswa</h1>
                    <a href="/siswa/add" class="btn-dark">
                        <i class="ri-add-circle-fill"></i>
                        Tambah
                    </a>
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
                            <option value="">Pilih..</option>
                            @foreach ($tingkatans as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <select name="jurusan_id" id="jurusan_id" class="form-control select2">
                            <option value="">Pilih..</option>
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
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Status</label>
                        <select name="status" id="status" class="form-control select2">
                            <option value="">Pilih..</option>
                            @foreach ($statuses as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-siswa" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th>Username</th>
                                <th>Nama Siswa</th>
                                <th>Tingkatan</th>
                                <th>Jurusan</th>
                                <th>Kelas</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Pengaturan</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>



    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Sukses",
                text: "Data Siswa berhasil di tambahkan",
                icon: "success"
            });
        @endif
    </script>

    <script>
        function loadDataTable() {
            $("#tbl-siswa").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: '{{ url('/siswa') }}',
                    data: function(data) {
                        data.tingkatan = $("#tingkatan_id").val();
                        data.jurusan_id = $("#jurusan_id").val();
                        data.kelas_id = $("#kelas_id").val();
                        data.user_id = $("#siswa").val();
                        data.status = $("#status").val();
                    }
                },
                drawCallback: function(res) {
                    console.log(res.json);
                },
                columns: [{
                        data: "no"
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
                    {
                        data: "status"
                    },
                    {
                        data: "settings",
                    },
                ]
            });
        }

        function clearDataTable() {
            $("#tbl-siswa").DataTable().clear().destroy();
        }

        loadDataTable();

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        const configSelect2 = {
            theme: 'bootstrap4',
            width: "100%",
        }

        $("#tingkatan_id").select2(configSelect2);
        $("#jurusan_id").select2(configSelect2);
        $("#kelas_id").select2(configSelect2);
        $("#siswa").select2(configSelect2);
        $("#status").select2(configSelect2);

        //change tingkatan
        $("#tingkatan_id").change(function() {
            clearDataTable();
            loadDataTable();
        });

        //change jurusan
        $("#jurusan_id").change(function() {
            $("#kelas_id").attr("disabled", true);
            $("#kelas_id").html("");

            clearDataTable();
            loadDataTable();

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
                    let opt = "<option value=''>Pilih...</option>";
                    for (let i = 0; i < response.kelases.length; i++) {
                        opt +=
                            `<option value="${response.kelases[i].kelas_id}">${response.kelases[i].nama_kelas}</option>`;
                    }

                    $("#kelas_id").html(opt);
                    $("#kelas_id").attr("disabled", false);
                }
            });
        });

        //kelas change
        $("#kelas_id").change(function() {
            clearDataTable();
            loadDataTable();
        });

        //status change
        $("#status").change(function() {
            clearDataTable();
            loadDataTable();
        });
    </script>
@endsection
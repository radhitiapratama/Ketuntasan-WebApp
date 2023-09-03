@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Detail Ketuntasan Siswa </h1>
                    <a href="{{ url('guru/wali-kelas') }}" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-1">
        <div class="card-body">
            <div class="form-group">
                <label for="#">Nama Siswa</label>
                <input type="text" class="form-control" value="{{ $siswa->nama }}" disabled>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Semester</label>
                        <select name="semester" id="semester" class="form-control select2">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Status</label>
                        <select name="tuntas" id="tuntas" class="form-control select2">
                            <option value="">Pilih...</option>
                            <option value="1">Tuntas</option>
                            <option value="0">Belum tuntas</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-ketuntasan" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th class="vertical-align-middle" width="5px">#</th>
                                <th class="vertical-align-middle">Mapel</th>
                                <th class="vertical-align-middle">Guru</th>
                                <th class="text-center" width="5px">Status</th>
                                <th class="vertical-align-middle" width="300px">Deskripsi</th>
                                <th class="vertical-align-middle">Tgl Tuntas</th>
                                <th class="text-center" width="5px">Semester</th>
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
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        function loadDatatable() {
            $("#tbl-ketuntasan").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                ajax: {
                    url: "{{ url('guru/wali-kelas/siswa/detail') }}",
                    data: function(data) {
                        data.semester = $("#semester").val();
                        data.siswa_id = {{ $siswa_id }};
                        data.tuntas = $("#tuntas").val();
                    }
                },
                drawCallback: function(res) {
                    console.log(res.json);
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "mapel"
                    },
                    {
                        data: "guru"
                    },
                    {
                        data: "tuntas"
                    },
                    {
                        data: "desc"
                    },
                    {
                        data: "tgl_tuntas"
                    },
                    {
                        data: "semester"
                    },
                ]
            });
        }

        function clearDatatable() {
            $("#tbl-ketuntasan").DataTable().clear().destroy();
        }

        loadDatatable();

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#semester").select2(configSelect2);
        $("#tuntas").select2(configSelect2);

        $("#semester").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#tuntas").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

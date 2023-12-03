@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/bootstrap-datepicker/css/bootstrap-datepicker.standalone.min.css') }}">
    <script src="{{ asset('plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
    <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
    <script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>

    <div class="card mb-3">
        <div class="card-body d-flex justify-content-end" style="gap: 20px">
            @if (auth()->guard('admin')->check() ||
                    (auth()->guard('operator')->check() &&
                        auth()->guard('operator')->user()->level == 1))
                <a href="/keterlambatan/add/by-qr" class="btn-dark">
                    <i class="ri-qr-code-line"></i>
                    Tambah dengan QR Code
                </a>
                <a class="btn-dark" href="/keterlambatan/add">
                    <i class="ri-add-line"></i>
                    Tambah
                </a>
            @endif
        </div>
    </div>

    <div class="card">
        <form action="/keterlambatan/cetak" target="_blank" method="post">
            @csrf
            <div class="card-header row mb-3">
                <div class="col-12 col-md-5">
                    <label for="#">Tanggal</label>
                    <input type="text" class="form-control" name="tgl" id="tgl">
                    <input type="hidden" id="tgl_start" name="tgl_start" value="<?= date('Y-m-d') ?>">
                    <input type="hidden" id="tgl_end" name="tgl_end" value="<?= date('Y-m-d') ?>">
                </div>
                <div class="col-12 col-md-2">
                    <label for="#">Ruang</label>
                    <select name="ruang" id="ruang" class="form-control">
                        <option value="">Pilih...</option>
                        @foreach ($ruangs as $ruang)
                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12 col-md-2">
                    <label for="#">Sesi</label>
                    <select name="sesi" id="sesi" class="form-control">
                        <option value="">Pilih...</option>
                        @foreach ($sesis as $sesi)
                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12 col-md-3">
                    <label for="#">Tidak Lanjut</label>
                    <select name="tidak_lanjut" id="tidak_lanjut" class="form-control">
                        <option value="">Pilih...</option>
                        @foreach ($tidak_lanjuts as $key => $value)
                            <option value="{{ $key }}">{{ $value }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="card-header">
                <button type="submit" class="btn-pdf">
                    Cetak PDF
                    <i class="ri-file-pdf-line"></i>
                </button>
            </div>
        </form>
        <div class="card-body table-responsive">
            <table width="100%" class="table table-bordered" id="tbl-terlambat">
                <thead>
                    <tr>
                        <th width="5">#</th>
                        <th>Siswa</th>
                        <th>Kelas</th>
                        <th width="5">Ruang</th>
                        <th width="5">Sesi</th>
                        <th>Alasan Terlambat</th>
                        <th class="text-center">Tidak Lanjut</th>
                        @if (auth()->guard('admin')->check() ||
                                (auth()->guard('operator')->check() &&
                                    auth()->guard('operator')->user()->level == 1))
                            <th width="5">Aksi</th>
                        @endif
                    </tr>
                </thead>
                <tbody class="tbody">
                </tbody>
            </table>
        </div>
    </div>


    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        let html = ``;
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        @if (auth()->guard('admin')->check() ||
                (auth()->guard('operator')->check() &&
                    auth()->guard('operator')->user()->level == 1))
            let table_columns = [{
                    data: "no"
                },
                {
                    data: "nama"
                },
                {
                    data: "kelas"
                },
                {
                    data: "ruang"
                },
                {
                    data: "sesi"
                },
                {
                    data: "alasan"
                },
                {
                    data: "tidak_lanjut"
                },
                {
                    data: "aksi"
                },
            ];
        @else

            let table_columns = [{
                    data: "no"
                },
                {
                    data: "nama"
                },
                {
                    data: "kelas"
                },
                {
                    data: "ruang"
                },
                {
                    data: "sesi"
                },
                {
                    data: "alasan"
                },
                {
                    data: "tidak_lanjut"
                },
            ];
        @endif



        loadDatatable();

        function loadDatatable() {
            $("#tbl-terlambat").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: "{{ url('keterlambatan') }}",
                    data: function(data) {
                        data.tgl_start = $("#tgl_start").val();
                        data.tgl_end = $("#tgl_end").val();
                        data.ruang = $("#ruang").val();
                        data.sesi = $("#sesi").val();
                        data.tidak_lanjut = $("#tidak_lanjut").val();
                    }
                },
                columns: table_columns,
            });
        }

        function clearDatatable() {
            $("#tbl-terlambat").DataTable().clear().destroy();
        }

        $('#tgl').daterangepicker({
            autoApply: true,
            locale: {
                format: "YYYY-MM-DD"
            }
        }, function(start, end, label) {
            let tgl_start = start.format("YYYY-MM-DD")
            let tgl_end = end.format("YYYY-MM-DD")
            $("#tgl_start").val(tgl_start);
            $("#tgl_end").val(tgl_end);
        });

        let a = $("#tgl").val();
        console.log(a);

        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);
        $("#tidak_lanjut").select2(configSelect2);

        $("#ruang").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#sesi").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#tgl").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#tidak_lanjut").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

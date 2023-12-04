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

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-3">
        <div class="card-body d-flex justify-content-end" style="gap: 20px">
            @if (auth()->guard('admin')->check() ||
                    (auth()->guard('operator')->check() &&
                        auth()->guard('operator')->user()->level == 1))
                <a href="/ketidakhadiran/add/by-qr" class="btn-dark">
                    <i class="ri-qr-code-line"></i>
                    Tambah dengan QR Code
                </a>
                <a class="btn-dark" href="/ketidakhadiran/add">
                    <i class="ri-add-line"></i>
                    Tambah
                </a>
            @endif
        </div>
    </div>

    <div class="card">
        <form action="/ketidakhadiran/cetak" target="_blank" method="post">
            @csrf
            <div class="card-header row mb-3">
                <div class="col-12 col-md-5">
                    <div class="form-group">
                        <label for="#">Tanggal</label>
                        <input type="text" class="form-control" name="tgl" id="tgl">
                        <input type="hidden" id="tgl_start" name="tgl_start" value="<?= date('Y-m-d') ?>">
                        <input type="hidden" id="tgl_end" name="tgl_end" value="<?= date('Y-m-d') ?>">
                    </div>
                </div>
                <div class="col-12 col-md-2">
                    <div class="form-group">
                        <label for="#">Ruang</label>
                        <select name="ruang" id="ruang" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($ruangs as $ruang)
                                <option value="{{ $ruang }}">{{ $ruang }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-12 col-md-2">
                    <div class="form-group">
                        <label for="#">Sesi</label>
                        <select name="sesi" id="sesi" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($sesis as $sesi)
                                <option value="{{ $sesi }}">{{ $sesi }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-12 col-md-3">
                    <div class="form-group">
                        <label for="#">Alasan</label>
                        <select name="alasan" id="alasan" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($alasans as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
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
            <table width="100%" class="table table-bordered" id="tbl-tidakhadir">
                <thead>
                    <tr>
                        <th width="5">#</th>
                        <th>Siswa</th>
                        <th>Kelas</th>
                        <th width="5">Ruang</th>
                        <th width="5">Sesi</th>
                        <th class="text-center">Alasan</th>
                        <th>Waktu</th>
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
                    data: "waktu"
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
                    data: "waktu"
                },
            ];
        @endif



        loadDatatable();

        function loadDatatable() {
            $("#tbl-tidakhadir").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: "{{ url('ketidakhadiran') }}",
                    data: function(data) {
                        data.tgl_start = $("#tgl_start").val();
                        data.tgl_end = $("#tgl_end").val();
                        data.ruang = $("#ruang").val();
                        data.sesi = $("#sesi").val();
                        data.alasan = $("#alasan").val();
                    }
                },
                columns: table_columns,
            });
        }

        function clearDatatable() {
            $("#tbl-tidakhadir").DataTable().clear().destroy();
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
        $("#alasan").select2(configSelect2);

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

        $("#alasan").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $(document).on("click", ".btn-delete", function() {
            let id = $(this).data("id");
            Swal.fire({
                title: "Peringatan !",
                text: "Apakah anda yakin ingin menghapus data?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                allowOutsideClick: false,
                confirmButtonText: "Iya,Hapus",
                cancelButtonText: "Batal"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: `/ketidakhadiran/delete`,
                        headers: {
                            "X-CSRF-TOKEN": csrfToken,
                        },
                        dataType: "json",
                        data: {
                            id,
                        },
                        success: function(response) {
                            Swal.fire({
                                title: "Berhasil!",
                                text: "Data berhasil di hapus",
                                icon: "success"
                            });
                            clearDatatable();
                            loadDatatable();
                        }
                    });
                }
            });
        });
    </script>
@endsection

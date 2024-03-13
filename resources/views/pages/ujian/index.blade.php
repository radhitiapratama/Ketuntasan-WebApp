@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Siswa Ujian</h1>
                    @if (auth()->guard('admin')->check() ||
                            (auth()->guard('operator')->check() && auth()->guard('operator')->user()->level == 1))
                        <a href="/ujian/add" class="btn-dark">
                            <i class="ri-add-circle-fill"></i>
                            Tambah
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header d-flex" style="gap: 20px">
            <button type="button" class="btn-pdf" data-toggle="modal" data-target="#modal-cetak-pdf">
                <i class="ri-qr-code-line"></i>
                Cetak QR Code
            </button>
        </div>
        <div class="card-header">
            <div class="row">
                <div class="col-12 col-md-3">
                    <label for="#">Ruang</label>
                    <select name="ruang" id="ruang" class="form-control">
                        <option value="">Pilih...</option>
                        @foreach ($ruangs as $ruang)
                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12 col-md-3">
                    <label for="#">Sesi</label>
                    <select name="sesi" id="sesi" class="form-control">
                        <option value="">Pilih...</option>
                        @foreach ($sesis as $sesi)
                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-ujian" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th width="5px">#</th>
                                <th class="text-center">Nama Siswa</th>
                                <th width="100px">Kelas</th>
                                <th class="text-center" width="100px">Ruang</th>
                                <th class="text-center" width="100px">Sesi</th>
                                @if (auth()->guard('admin')->check() ||
                                        (auth()->guard('operator')->check() && auth()->guard('operator')->user()->level == 1))
                                    <th class="text-center" width="5px">Aksi</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modal-cetak-pdf" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cetak QR Code Siswa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/ujian/cetak-qr" method="POST" target="_blank">
                        @csrf
                        <div class="row mb-3">
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Semester</label>
                                    <select name="semester_cetak" id="semester_cetak" class="form-control" required>
                                        <option value="">Pilih...</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <select name="ruang_cetak" id="ruang_cetak" class="form-control" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($ruangs as $ruang)
                                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <select name="sesi_cetak" id="sesi_cetak" class="form-control" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($sesis as $sesi)
                                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 d-flex justify-content-center" style="gap: 20px">
                                <button type="button" class="btn-dark" data-dismiss="modal">
                                    <i class="ri-close-circle-line"></i>
                                    Batal
                                </button>
                                <button type="submit" class="btn-dark" id="btn-tuntaskan">
                                    <i class="ri-check-line"></i>
                                    Cetak
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>

    <script>
        @if (session()->has('success_import'))
            Swal.fire({
                title: "{{ session('success_import') }}",
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

        @if (session()->has('max_rows'))
            Swal.fire({
                title: "{{ session('max_rows') }}",
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
    </script>

    <script>
        @if (auth()->guard('admin')->check() ||
                (auth()->guard('operator')->check() && auth()->guard('operator')->user()->level == 1))
            let tableColumns = [{
                    data: "no"
                }, {
                    data: "nama"
                }, {
                    data: "kelas"
                }, {
                    data: "ruang"
                }, {
                    data: "sesi"
                },
                {
                    data: "aksi"
                }
            ];
        @else
            let tableColumns = [{
                data: "no"
            }, {
                data: "nama"
            }, {
                data: "kelas"
            }, {
                data: "ruang"
            }, {
                data: "sesi"
            }, ];
        @endif



        function loadDatatable() {
            $("#tbl-ujian").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: "{{ url('/ujian') }}",
                    data: function(data) {
                        data.ruang = $("#ruang").val();
                        data.sesi = $("#sesi").val();
                    }
                },
                columns: tableColumns
            });
        }

        function clearDatatable() {
            $("#tbl-ujian").DataTable().clear().destroy();
        }

        loadDatatable();

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        const configSelect2Modal = {
            dropdownParent: $('#modal-cetak-pdf'),
            theme: "bootstrap4",
            width: "100%"
        }

        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);
        $("#ruang_cetak").select2(configSelect2Modal);
        $("#sesi_cetak").select2(configSelect2Modal);
        $("#semester_cetak").select2(configSelect2Modal);

        $("#ruang").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#sesi").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

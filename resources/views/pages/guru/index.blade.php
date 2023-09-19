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
                    <h1 class="page-title">Data Guru</h1>
                    <a href="guru/add" class="btn-dark">
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
                <div class="col-12 d-flex gap-20">
                    <button type="button" class="btn-excel" data-toggle="modal" data-target="#import_modal">
                        <i class="ri-file-excel-2-line"></i>
                        Import Guru
                    </button>
                    <a href="{{ asset('excel/template-guru.xlsx') }}" class="btn-excel">
                        <i class="ri-file-excel-2-line"></i>
                        Download Template
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Status</label>
                        <select name="status" id="status" class="form-control">
                            <option value="">Pilih...</option>
                            <option value="1">Status</option>
                            <option value="0">Nonaktif</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-guru" style="width: 100%">
                        <thead>
                            <tr>
                                <th width="5px">#</th>
                                <th class="text-center" width="100px">Kode Guru</th>
                                <th>Username</th>
                                <th>Nama Guru</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    {{-- Modal Import Data Guru --}}
    <div class="modal fade" id="import_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Import Data Guru</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ url('guru/import') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group mb-5">
                            <label for="#">Import Guru</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01"
                                        aria-describedby="inputGroupFileAddon01" name="excel_file">
                                    <label class="custom-file-label" for="inputGroupFile01">Jenis File .xlsx</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 d-flex justify-content-center" style="gap: 20px">
                                <button type="button" class="btn-dark" data-dismiss="modal">
                                    <i class="ri-close-circle-line"></i>
                                    Batal
                                </button>
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Import
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>


    <script>
        @if (session()->has('successImport'))
            Swal.fire({
                title: "{{ session('successImport') }}",
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

        @if (session()->has('username_not_unique'))
            Swal.fire({
                title: "{{ session('username_not_unique') }}",
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

        @if (session()->has('max_count'))
            Swal.fire({
                title: "{{ session('max_count') }}",
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

        @if (session()->has('import_failed'))
            Swal.fire({
                title: "{{ session('import_failed') }}",
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

        @if (session()->has('duplicate_kodeGuru'))
            Swal.fire({
                title: "{{ session('duplicate_kodeGuru') }}",
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

        @error('excel_file')
            Swal.fire({
                title: "{{ $message }}",
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
        @enderror
    </script>

    <script>
        function loadDatatable() {
            $("#tbl-guru").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                ajax: {
                    url: "/guru",
                    data: function(data) {
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
                        data: "kode_guru"
                    },
                    {
                        data: "username"
                    },
                    {
                        data: "nama"
                    },
                    {
                        data: "status"
                    },
                    {
                        data: "setting"
                    },
                ]
            });
        }

        function clearDatatable() {
            $("#tbl-guru").DataTable().clear().destroy();
        }

        loadDatatable();

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $('input[type="file"]').change(function(e) {
            var fileName = e.target.files[0].name;
            $('.custom-file-label').html(fileName);
        });

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        $("#status").select2(configSelect2);

        $("#status").change(function() {
            clearDatatable();
            loadDatatable();
        });
    </script>
@endsection

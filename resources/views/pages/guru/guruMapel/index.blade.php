@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Guru Mapel</h1>
                    <a href="guru-mapel/add" class="btn-dark">
                        <i class="ri-add-circle-fill"></i>
                        Tambah
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row mb-1">
                <div class="col-12 d-flex gap-20">
                    <button type="button" class="btn-excel" data-toggle="modal" data-target="#import_modal">
                        <i class="ri-file-excel-2-line"></i>
                        Import Guru Mapel
                    </button>
                    <a href="{{ asset('excel/template-guru-mapel.xlsx') }}" class="btn-excel">
                        <i class="ri-file-excel-2-line"></i>
                        Download Template
                    </a>
                </div>
            </div>
            @if ($errors->has('excel_file'))
                <div class="row">
                    @foreach ($errors->get('excel_file') as $message)
                        <div class="col-12">
                            <small class="text-danger">{{ $message }}</small>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-guruMapel" style="width: 100%">
                        <thead>
                            <tr>
                                <th width="5px" class=" vertical-align-middle">#</th>
                                <th width="100px" class="text-center vertical-align-middle">Kode Guru</th>
                                <th class=" vertical-align-middle">Nama Guru</th>
                                <th class=" vertical-align-middle">Nama Mapel</th>
                                <th class="text-center vertical-align-middle">Kode Guru Mapel</th>
                                <th width="5px" class="text-cente vertical-align-middle">Status</th>
                                <th class="text-center vertical-align-middle">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Detail Guru Mapel -->
    <div class="modal fade" id="modal_detailMapel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Data Mapel</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body-dataMapel">
                    <div class="form-group">
                        <label for="#">Nama Guru</label>
                        <input type="text" class="form-control" id="detail-nama-guru" disabled value="Prosess....">
                    </div>
                    <div class="form-group">
                        <label for="#">Mapel yang di ajar</label>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center" style="width: 200px">Kode Guru Mapel</th>
                                    <th class="vertical-align-middle">Mapel</th>
                                    <th class="text-center vertical-align-middle">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="2" class="text-center">Process...</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



    {{-- Modal Import Guru Mapel --}}
    <div class="modal fade" id="import_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Import Data Guru Mapel</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ url('guru-mapel/import') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group mb-5">
                            <label for="#">Import Guru Mapel</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01"
                                        aria-describedby="inputGroupFileAddon01" name="excel_file" required>
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

    <script>
        @if (session()->has('import_success'))
            Swal.fire({
                title: "{{ session('import_success') }}",
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

        @if (session()->has('mapel_null'))
            Swal.fire({
                title: "{{ session('mapel_null') }}",
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

        @if (session()->has('guru_null'))
            Swal.fire({
                title: "{{ session('guru_null') }}",
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

        @if (session()->has('guru_mapel_duplicate'))
            Swal.fire({
                title: "{{ session('guru_mapel_duplicate') }}",
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
        function loadDatatable() {
            $("#tbl-guruMapel").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                ajax: {
                    url: "{{ url('guru-mapel') }}",
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
                        data: "nama"
                    },
                    {
                        data: "nama_mapel"
                    },
                    {
                        data: "kode_guru_mapel"
                    },
                    {
                        data: "status"
                    },
                    {
                        data: "settings"
                    },
                ]
            });
        }

        loadDatatable();

        // const csrfToken = $('meta[name="csrf-token"]').attr("content");

        // $(document).on('click', ".detail-guru-mapel", function() {
        //     $("#modal-body-dataMapel tbody").html(`
    //     <tr>
    //         <td colspan="2" class="text-center">Process...</td>
    //     </tr>
    //     `);

        //     $("#detail-nama-guru").val("Process...");

        //     $.ajax({
        //         type: "POST",
        //         url: "/guru-mapels",
        //         headers: {
        //             "X-CSRF-TOKEN": csrfToken
        //         },
        //         data: {
        //             guru_id: $(this).data("guru-id")
        //         },
        //         dataType: "json",
        //         success: function(response) {
        //             console.log(response);
        //             $("#detail-nama-guru").val(response.guru.nama);
        //             let data = `
    //             <tr>
    //                 <td colspan="3" class="text-center">Tidak ada mapel yang di ajar</td>
    //             </tr>
    //             `;

        //             if (response.mapels.length > 0) {
        //                 data = ``;
        //                 for (let i = 0; i < response.mapels.length; i++) {
        //                     let status = "";
        //                     if (response.mapels[i].status == 0) {
        //                         status = `<span class="badge badge-danger p-2">Nonaktif</span>`;
        //                     } else {
        //                         status = `<span class="badge badge-success p-2">Aktif</span>`;
        //                     }

        //                     data += `
    //                             <tr>
    //                                 <td>${response.mapels[i].kode_guru},${response.mapels[i].kode_guru_mapel}</td>
    //                                 <td>${response.mapels[i].nama_mapel}</td>
    //                                 <td class='text-center'>${status}</td>
    //                             </tr>
    //                             `;

        //                 }
        //             }

        //             $("#modal-body-dataMapel tbody").html(data);
        //         }
        //     });
        // });

        $('input[type="file"]').change(function(e) {
            var fileName = e.target.files[0].name;
            $('.custom-file-label').html(fileName);
        });
    </script>
@endsection

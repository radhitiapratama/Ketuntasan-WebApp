@extends('layout.main')

@section('content')
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
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-guruMapel" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th>Username</th>
                                <th>Nama Guru</th>
                                <th class="text-center">Status Guru</th>
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

    <!-- Modal -->
    <div class="modal fade" id="modal_detailMapel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
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
                                    <th>Mapel</th>
                                    <th class="text-center">Status</th>
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

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>


    <script>
        function loadDatatable() {
            $("#tbl-guruMapel").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
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
                        data: "username"
                    },
                    {
                        data: "nama"
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

        const csrfToken = $('meta[name="csrf-token"]').attr("content");

        $(document).on('click', ".detail-guru-mapel", function() {
            $("#modal-body-dataMapel tbody").html(`
            <tr>
                <td colspan="2" class="text-center">Process...</td>
            </tr>
            `);

            $("#detail-nama-guru").val("Process...");

            $.ajax({
                type: "POST",
                url: "/guru-mapels",
                headers: {
                    "X-CSRF-TOKEN": csrfToken
                },
                data: {
                    guru_id: $(this).data("guru-id")
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    $("#detail-nama-guru").val(response.guru.nama);
                    let data = `
                    <tr>
                        <td colspan="2" class="text-center">Tidak ada mapel yang di ajar</td>
                    </tr>
                    `;

                    if (response.mapels.length > 0) {
                        data = ``;
                        for (let i = 0; i < response.mapels.length; i++) {
                            let status = "";
                            if (response.mapels[i].status == 0) {
                                status = `<span class="badge badge-danger p-2">Nonaktif</span>`;
                            } else {
                                status = `<span class="badge badge-success p-2">Aktif</span>`;
                            }

                            data += `
                                    <tr>
                                        <td>${response.mapels[i].nama_mapel}</td>
                                        <td class='text-center'>${status}</td>
                                    </tr>
                                    `;

                        }
                    }

                    $("#modal-body-dataMapel tbody").html(data);
                }
            });
        });
    </script>
@endsection

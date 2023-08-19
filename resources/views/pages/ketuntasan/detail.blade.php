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
                    <h1 class="page-title">Detail Ketuntasan Siswa </h1>
                    <form action="{{ url('ketuntasan/siswas') }}" method="post">
                        @csrf
                        <input type="hidden" name="tingkatan" value="{{ $tingkatan }}">
                        <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                        <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                        <button type="submit" class="btn-dark">
                            <i class="ri-arrow-left-line"></i>
                            Kembali
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6 col-12">
                    <div class="form-group">
                        <input type="text" class="form-control" disabled value="{{ $siswa->nama }}">
                    </div>
                </div>
                <div class="col-md-6 col-12 d-flex justify-content-center justify-content-md-end">
                    <div class="form-group">
                        <button type="button" class="btn-dark btn-modal-tuntaskan">
                            <i class="ri-check-line"></i>
                            Tuntaskan
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="form-group">
                        <label for="#">Semester</label>
                        <select name="semester" id="semester" class="form-control select2">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-siswaMapel" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th style="width: 5px">#</th>
                                <th class="text-center"><input type="checkbox" name="check_all" id="check_all"></th>
                                <th>Mapel</th>
                                <th>Guru</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Deskripsi</th>
                                <th class="text-center">Tgl Tuntas</th>
                                <th class="text-center" style="width: 5px">Semester</th>
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

    <!-- Modal -->
    <div class="modal fade" id="modal_desc" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tuntaskan Siswa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea name="desc" id="text-area-desc" cols="30" rows="8" class="form-control"
                            placeholder="Deskripsi..."></textarea>
                    </div>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center" style="gap: 20px">
                            <button type="button" class="btn-dark" data-dismiss="modal">
                                <i class="ri-close-circle-line"></i>
                                Batal
                            </button>
                            <button type="button" class="btn-dark" id="btn-tuntaskan">
                                <i class="ri-check-line"></i>
                                Tuntaskan
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        function showLoading() {
            Swal.fire({
                title: "Sedang memprosess,",
                text: "Jangan tutup Browser / tekan tombol kembali",
                icon: "info",
                showConfirmButton: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
        }

        function hideLoading() {
            Swal.close();
        }

        function loadDatatable() {
            $("#tbl-siswaMapel").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                paging: false,
                ajax: {
                    url: "{{ url('ketuntasan/siswas/show') }}",
                    data: function(data) {
                        data.semester = $("#semester").val();
                        data.tingkatan = {{ $tingkatan }};
                        data.jurusan_id = {{ $jurusan_id }};
                        data.kelas_id = {{ $kelas_id }};
                        data.user_id = {{ $user_id }}
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
                    {
                        data: "settings"
                    },
                ]
            });
        }

        function clearDatatable() {
            $("#tbl-siswaMapel").DataTable().clear().destroy();
        }

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        loadDatatable();

        $("#semester").select2(configSelect2);

        $("#semester").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#check_all").click(function() {
            $("input[name='ketuntasan_id[]']").prop("checked", this.checked);
        });

        $(".btn-modal-tuntaskan").click(function() {
            const checked = $("input[name='ketuntasan_id[]']:checked").length;
            if (checked <= 0) {
                Swal.fire({
                    title: "Minimal ada 1 mapel yang di tuntaskan",
                    icon: "info",
                });

                return;
            }

            $("#modal_desc").modal("show");
        });

        // tuntaskan
        $("#btn-tuntaskan").click(function() {
            $("#modal_desc").modal("hide");
            showLoading();

            let ketuntasans = [];

            $("input[name='ketuntasan_id[]']:checked").each(function() {
                ketuntasans.push($(this).val());
            });

            $.ajax({
                type: "POST",
                url: '{{ url('ketuntasan/tuntaskan-siswa') }}',
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    ketuntasan_id: ketuntasans,
                    desc: $("#text-area-desc").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    hideLoading();
                    Swal.fire({
                        title: "Siswa berhasil di tuntaskan",
                        icon: "success",
                    });

                    clearDatatable();
                    loadDatatable();
                }
            });
        });
    </script>
@endsection

@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Detail Ketuntasan Siswa </h1>
                    <form action="{{ url('guru/ketuntasan/kelas') }}" method="post">
                        @csrf
                        <input type="hidden" name="mapel_id" value="{{ $mapel_id }}">
                        <button type="submit" class="btn-dark">
                            <i class="ri-arrow-left-line"></i>
                            Kembali
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-4 col-12">
                    <div class="form-group">
                        <label for="#">Tingkatan</label>
                        @if ($tingkatan == 1)
                            <input type="text" class="form-control" disabled value="X">
                        @endif
                        @if ($tingkatan == 2)
                            <input type="text" class="form-control" disabled value="XI">
                        @endif
                        @if ($tingkatan == 3)
                            <input type="text" class="form-control" disabled value="XII">
                        @endif
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="form-group">
                        <label for="#">Jurusan</label>
                        <input type="text" class="form-control" disabled value="{{ $nama_jurusan }}">
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="form-group">
                        <label for="#">Kelas</label>
                        <input type="text" class="form-control" disabled value="{{ $nama_kelas }}">
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-center mb-3">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="#">Semester</label>
                        <select name="semester" id="semester" class="form-control select2">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="#">Status</label>
                        <select name="status" id="status" class="form-control select2">
                            <option value="">Pilih...</option>
                            @foreach ($tuntases as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <div class="form-group">
                        @if ($status == 'belum')
                            <button class="btn-dark">
                                Belum Waktunya
                            </button>
                        @endif

                        @if ($status == 'lewat')
                            <button class="btn-dark">
                                Sudah lewat dari batas waktu
                            </button>
                        @endif

                        @if ($status == 'true')
                            <button type="button" class="btn-dark btn-modal-tuntaskan">
                                <i class="ri-check-line"></i>
                                Tuntaskan
                            </button>
                        @endif
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-siswaMapel" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px">#</th>
                                <th class="text-center"><input type="checkbox" name="check_all" id="check_all"></th>
                                <th>Siswa</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Deskripsi</th>
                                <th class="text-center">Tgl Tuntas</th>
                                <th class="text-center">Semester</th>
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

    @if ($status == 'true')
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
    @endif

    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
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
                ordering: false,
                paging: false,
                serverSide: true,
                processing: true,
                info: false,
                ajax: {
                    url: "{{ url('guru/ketuntasan/kelas/siswa') }}",
                    data: function(data) {
                        data.status = $("#status").val();
                        data.semester = $("#semester").val();
                        data.mapel_id = {{ $mapel_id }};
                        data.tingkatan = {{ $tingkatan }};
                        data.jurusan_id = {{ $jurusan_id }};
                        data.kelas_id = {{ $kelas_id }};
                    }
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "checkbox"
                    },
                    {
                        data: "siswa"
                    },
                    {
                        data: "status"
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

        loadDatatable();

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        }

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        $("#semester").select2(configSelect2);
        $("#status").select2(configSelect2);

        $("#semester").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#status").change(function() {
            clearDatatable();
            loadDatatable();
        });

        $("#check_all").click(function() {
            $("input[name='ketuntasan_id[]']").prop("checked", this.checked);
        });

        @if ($status == 'true')
            $(".btn-modal-tuntaskan").click(function() {
                const checked = $("input[name='ketuntasan_id[]']:checked").length;
                if (checked <= 0) {
                    Swal.fire({
                        title: "Minimal ada 1 siswa yang di tuntaskan",
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
        @endif
    </script>
@endsection

@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>

    @php
        // function checkTingkatan($tingkatan)
        // {
        //     if ($tingkatan == 1) {
        //         return 'X';
        //     }

        //     if ($tingkatan == 2) {
        //         return 'XI';
        //     }

        //     if ($tingkatan == 3) {
        //         return 'XII';
        //     }
        // }
    @endphp



    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-end" style="gap: 20px;">
                    <a href="/ketuntasan/by-ruang" class="btn-dark">
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="#">Nama Siswa</label>
                        <p>{{ $siswa->nama }}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-header">
            <div class="row">
                <div class="col-12 col-md-3">
                    <div class="form-group">
                        <label for="#">Tuntas</label>
                        <select name="tuntas" id="tuntas" class="form-control">
                            @foreach ($tuntases as $key => $value)
                                <option value="{{ $key }}" @selected($key == 0)>{{ $value }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-12 col-md-3">
                    <div class="form-group">
                        <label for="#">Semester</label>
                        <select name="semester" id="semester" class="form-control">
                            <option value="">Pilih...</option>
                            @foreach ($semesters as $semester)
                                <option value="{{ $semester }}">{{ $semester }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        {{-- <div class="card-header">
            <form action="/ketuntasan/by-guru/cetak" method="post" target="_blank">
                @csrf
                <input type="hidden" name="guru_id_cetak" value="{{ $guru_id }}">
                <input type="hidden" name="mapel_id_cetak" value="{{ $mapel_id }}">
                <input type="hidden" name="kelas_id_cetak" value="{{ $kelas_id }}">
                <input type="hidden" name="tingkatan_cetak" value="{{ $tingkatan }}">
                <input type="hidden" name="status_cetak">
                <input type="hidden" name="semester_cetak">
                <input type="hidden" name="nama_guru_cetak" value="{{ $data_guru->nama }}">
                <input type="hidden" name="nama_mapel_cetak" value="{{ $data_mapel->nama_mapel }}">
                <input type="hidden" name="nama_kelas_cetak"
                    value="{{ checkTingkatan($tingkatan) }} {{ $data_kelas->nama_jurusan }} | {{ $data_kelas->nama_kelas }} ">
                <button type="submit" class="btn-pdf">Cetak PDF <i class="ri-file-pdf-line"></i></button>
            </form>
        </div> --}}
        @if (auth()->guard('admin')->check() ||
                (auth()->guard('operator')->check() &&
                    auth()->guard('operator')->user()->level == 1))
            <div class="card-header">
                <button type="button" class="btn-dark" data-toggle="modal" data-target="#modal-tuntas">
                    <i class="ri-check-line"></i>
                    Tuntaskan
                </button>
            </div>
        @endif
        <div class="card-body table-responsive">
            <table width="100%" id="tbl-ketuntasans" class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" width="5">#</th>
                        @if (auth()->guard('admin')->check() ||
                                (auth()->guard('operator')->check() &&
                                    auth()->guard('operator')->user()->level == 1))
                            <th class="text-center" width="5">
                                <input type="checkbox" id="check_all">
                            </th>
                        @endif
                        <th class="vertical-middle">Guru</th>
                        <th class="vertical-middle">Mapel</th>
                        <th class="vertical-middle text-center" width="5">Status</th>
                        <th class="vertical-middle text-center">Deskripsi</th>
                        <th class="vertical-middle text-center">Tgl Tuntas</th>
                        <th class="vertical-middle text-center">Semester</th>
                        @if (auth()->guard('admin')->check() ||
                                (auth()->guard('operator')->check() &&
                                    auth()->guard('operator')->user()->level == 1))
                            <th class="vertical-middle text-center" width="5">Aksi</th>
                        @endif
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal fade" id="modal-tuntas" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <script>
        @if (session()->has('failed_batas_waktu'))
            Swal.fire({
                title: "Bukan waktunya untuk menuntaskan ketuntasan !",
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

        @if (session()->has('no_ketuntasan'))
            Swal.fire({
                title: "Minimal ada satu ketuntasan yang di tuntaskan",
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

        @if (session()->has('success'))
            Swal.fire({
                title: "Ketuntasan berhasil di tuntaskan",
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
    </script>

    <script>
        @if (auth()->guard('admin')->check() ||
                (auth()->guard('operator')->check() &&
                    auth()->guard('operator')->user()->level == 1))
            let table_columns = [{
                    data: 'no',
                },
                {
                    data: 'check_box',
                },
                {
                    data: 'nama',
                },
                {
                    data: 'nama_mapel',
                },
                {
                    data: 'tuntas',
                },
                {
                    data: 'desc',
                },
                {
                    data: 'tgl_tuntas',
                },
                {
                    data: 'semester',
                },
                {
                    data: 'aksi',
                },
            ];
        @else
            let table_columns = [{
                    data: 'no',
                },
                {
                    data: 'nama',
                },
                {
                    data: 'nama_mapel',
                },
                {
                    data: 'tuntas',
                },
                {
                    data: 'desc',
                },
                {
                    data: 'tgl_tuntas',
                },
                {
                    data: 'semester',
                },
            ];
        @endif


        const SISWA_ID = '{{ $siswa_id }}';
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

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
            $("#tbl-ketuntasans").DataTable({
                info: false,
                paging: false,
                serverSide: true,
                processing: true,
                ordering: false,
                searchDelay: 1500,
                drawCallback: function(res) {
                    console.log(res.json);
                },
                ajax: {
                    url: `/ketuntasan/by-ruang/siswa/${SISWA_ID }`,
                    data: function(data) {
                        data.tuntas = $("#tuntas").val();
                        data.semester = $("#semester").val();
                    }
                },
                columns: table_columns,
            });
        }

        function clearDatatable() {
            $("#tbl-ketuntasans").DataTable().clear().destroy();

        }

        loadDatatable();

        $("#check_all").click(function() {
            $("input[name='ketuntasan_id[]']").prop("checked", this.checked);
        });


        $("#tuntas").select2(configSelect2);
        $("#semester").select2(configSelect2);

        $("#tuntas").change(function() {
            clearDatatable();
            loadDatatable();
            $("input[name='status_cetak']").val($(this).val());
        });

        $("#semester").change(function() {
            clearDatatable();
            loadDatatable();
            $("input[name='semester_cetak']").val($(this).val());
        });

        $("#btn-tuntaskan").click(function() {
            const checked = $("input[name='ketuntasan_id[]']:checked").length;
            if (checked <= 0) {
                Swal.fire({
                    title: "Minimal ada 1 mapel yang di tuntaskan",
                    icon: "info",
                });

                return;
            }

            $("#modal-tuntas").modal("hide");
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

                    if (response.message == "kurang") {
                        Swal.fire({
                            title: "Gagal,Kurang dari batas waktu yg sdh di tentukan",
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
                    }

                    if (response.message == "lebih") {
                        Swal.fire({
                            title: "Gagal,Lebih dari batas waktu yg sdh di tentukan",
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
                    }

                    if (response.message == "success") {
                        hideLoading();
                        Swal.fire({
                            title: "Mapel siswa berhasil di tuntaskan",
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

                        clearDatatable();
                        loadDatatable();
                    }

                }
            });

        });
    </script>
@endsection

@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah ketidakhadiran siswa</h1>
                    <a href="/ketidakhadiran" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-body">
                    <form action="/ketidakhadiran/store" method="POST">
                        @csrf
                        <input type="hidden" name="siswa">
                        <div class="form-group">
                            <label for="#">Scan QR</label>
                            <input type="text" class="form-control" name="scan_qr" id="scan_qr" autofocus
                                autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <input type="text" class="form-control pointer-none" id="siswa" disabled tabindex="-1">
                        </div>
                        <div class="form-group">
                            <label for="#">Ruang</label>
                            <input type="text" class="ruang form-control pointer-none" id="ruang" required
                                tabindex="-1" disabled>
                        </div>
                        <div class="form-group">
                            <label for="#">Sesi</label>
                            <input type="text" class="sesi form-control pointer-none" id="sesi" required
                                tabindex="-1" disabled>
                        </div>
                        <div class="form-group">
                            <label for="#">Alasan</label>
                            <select name="alasan" id="alasan" class="form-control" required>
                                <option value="">Pilih....</option>
                                @foreach ($alasans as $key => $value)
                                    <option value="{{ $key }}">{{ $value }}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn-dark">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script>
        @if (session()->has('success'))
            Swal.fire({
                title: "{{ session('success') }}",
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

        @if (session()->has('siswa_notfound'))
            Swal.fire({
                title: "{{ session('siswa_notfound') }}",
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
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#alasan").select2(configSelect);

        function checkSiswa(e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "{{ url('ujian/check-siswa') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    siswa_id: $("input[name='scan_qr']").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response)
                    if (response.status == false) {
                        Swal.fire({
                            title: "Data Siswa tidak ditemukan",
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
                        return;
                    }

                    $("#siswa").val(response.data.nama);
                    $("#ruang").val(response.data.ruang);
                    $("#sesi").val(response.data.sesi);

                    $("input[name='siswa']").val(response.data.siswa_id);
                    $("input[name='ruang']").val(response.data.ruang);
                    $("input[name='sesi']").val(response.data.sesi);

                    $("#scan_qr").val("");
                    $("#alasan").focus();
                }
            });
        }

        $("input[name='scan_qr']").keydown(function(e) {
            if (e.keyCode == 13) {
                checkSiswa(e);
            }
        });
    </script>
@endsection

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
                        <div class="form-group">
                            <label for="#">Semester</label>
                            <select name="semester" id="semester" class="form-control">
                                <option value="">Pilih...</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <select name="siswa" id="siswa" class="form-control" required disabled>
                                <option value="">Pilih...</option>
                                @foreach ($siswas as $siswa)
                                    <option value="{{ $siswa->siswa_id }}">{{ $siswa->nama }} |
                                        {{ App\Models\Utils::checkTingkatan($siswa->tingkatan) }} {{ $siswa->nama_kelas }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <input type="text" name="ruang" class="ruang form-control pointer-none" disabled
                                        id="ruang" required tabindex="-1">
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <input type="text" name="sesi" class="sesi form-control pointer-none"
                                        id="sesi" required disabled tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="#">Alasan Terlambat</label>
                            <select name="alasan" id="alasan" class="form-control" required>
                                <option value="">Pilih...</option>
                                @foreach ($alasans as $key => $value)
                                    <option value="{{ $key }}" @selected(old('alasan') == $key)>{{ $value }}
                                    </option>
                                @endforeach
                            </select>
                            @error('alasan')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
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
        function checkTingkatan(tingkatan) {
            if (tingkatan == 1) {
                return "X"
            } else if (tingkatan == 2) {
                return "XI"
            } else {
                return "XII"
            }
        }

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#semester").select2(configSelect);
        $("#siswa").select2(configSelect);
        $("#alasan").select2(configSelect);

        $("#semester").change(function() {
            let semester = $(this).val();
            console.log(semester)

            if (semester == "") return

            $("#siswa").attr("disabled", true)
            $("#ruang").attr("disabled", true)
            $("#sesi").attr("disabled", true)
            $("#ruang").val("")
            $("#sesi").val("")
            $("#siswa").html(`<option value="
                ">Pilih...</option>`)

            $.ajax({
                type: "GET",
                url: `{{ url('ujian/siswa/semester/${semester}') }}`,
                dataType: "json",
                success: function(response) {
                    console.log(response)
                    let options = '<option value="">Pilih...</option>'
                    let siswas = response.siswas;

                    for (let i = 0; i < siswas.length; i++) {
                        options +=
                            `<option value="${siswas[i].id}">${siswas[i].siswa.nama} | ${checkTingkatan(siswas[i].siswa.tingkatan)} ${siswas[i].siswa.kelas.nama_kelas}</option>`
                    }

                    $("#siswa").html(options);
                    $("#siswa").removeAttr("disabled")
                }
            });
        })

        $("#siswa").change(function() {
            let ujian_id = $(this).val();
            $.ajax({
                type: "GET",
                url: `{{ url('ujian/${ujian_id}') }}`,
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
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

                    $("#ruang").val(response.data.ruang);
                    $("#sesi").val(response.data.sesi);
                    $("#ruang").removeAttr("disabled")
                    $("#sesi").removeAttr("disabled")
                }
            });
        });
    </script>
@endsection

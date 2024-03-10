@extends('layout.main')

@section('content')
    @php
        use App\Models\Utils;
    @endphp

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Tambah Data Ujian</h1>
                    <a href="/ujian" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="/ujian/store" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-2 col-12">
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <select name="ruang" id="ruang" class="form-control ruang" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($ruangs as $ruang)
                                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2 col-12">
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <select name="sesi" id="sesi" class="form-control sesi" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($sesis as $sesi)
                                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2 col-12">
                                <div class="form-group">
                                    <label for="#">Tingkatan</label>
                                    <select name="tingkatan" id="tingkatan" class="form-control tingkatan" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($tingkatans as $key => $value)
                                            <option value="{{ $key }}">{{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="#">Kelas</label>
                                    <select name="kelas" id="kelas" class="form-control kelas" required disabled>
                                        <option value="">Pilih...</option>
                                        @foreach ($kelases as $kelas)
                                            <option value="{{ $kelas->jurusan_id }}|{{ $kelas->kelas_id }}">
                                                {{ $kelas->nama_jurusan }} | {{ $kelas->nama_kelas }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2 col-12">
                                <div class="form-group">
                                    <label for="#">Semester</label>
                                    <select name="semester" id="semester" class="form-control semester" required disabled>
                                        <option value="">Pilih...</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Dari Siswa</label>
                                    <select name="siswa_start" id="siswa_start" class="form-control " disabled required>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="#">Sampai Siswa</label>
                                    <select name="siswa_end" id="siswa_end" class="form-control siswa_end" disabled
                                        required>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn-dark">
                                    Submit
                                    <i class="ri-check-line"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    {{-- <div class="row">
                        <div class="col-12">
                            <form action="/ujian/store" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="#">Nama Siswa</label>
                                    <select name="siswa[]" id="siswa" class="form-control siswa-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($siswas as $siswa)
                                            <option value="{{ $siswa->siswa_id }}">{{ $siswa->nama }}
                                                {{ Utils::checkTingkatan($siswa->tingkatan) }} {{ $siswa->nama_kelas }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <select name="ruang[]" id="ruang" class="form-control ruang-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($ruangs as $ruang)
                                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <select name="sesi[]" id="sesi" class="form-control sesi-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($sesis as $sesi)
                                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-wrapper">
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 text-center">
                                        <button type="button" class="btn-dark m-auto" id="btn-add">
                                            <i class="ri-add-circle-line"></i>
                                        </button>
                                    </div>
                                </div>
                                <button type="submit" class="btn-dark m-auto">
                                    <i class="ri-check-line"></i>
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

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

        @if (session()->has('absen_harus_urut'))
            Swal.fire({
                title: "{{ session('absen_harus_urut') }}",
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
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);
        $("#tingkatan").select2(configSelect2);
        $("#kelas").select2(configSelect2);
        $("#semester").select2(configSelect2);
        $("#siswa_start").select2(configSelect2);
        $("#siswa_end").select2(configSelect2);

        $("#tingkatan").on("change", function() {
            $("#kelas").removeAttr("disabled")
        })

        $("#kelas").on("change", function() {
            $("#semester").removeAttr("disabled")
        })

        $("#semester").on("change", function() {
            let tingkatan = $("#tingkatan").val()
            let arrKelas = $("#kelas").val().split("|")
            let semester = $("#semester").val();


            $.ajax({
                type: "GET",
                url: `{{ url('helper/ordered-siswa-by-kelas/${tingkatan}/${arrKelas[0]}/${arrKelas[1]}/${semester}') }}`,
                dataType: "json",
                success: function(response) {
                    console.log(response)
                    let html = '<option value="">Pilih...</option>'
                    for (let i = 0; i < response.length; i++) {
                        html += `<option value="${response[i].siswa_id}">${response[i].nama}</option>`
                    }

                    $("#siswa_start").html(html)
                    $("#siswa_end").html(html)

                    $("#siswa_start").removeAttr("disabled")
                    $("#siswa_end").removeAttr("disabled")
                }
            });
        })


        $(document).on("click", ".btn-remove", function(e) {
            let parent = e.target.parentElement.remove();
        });

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });
    </script>
@endsection

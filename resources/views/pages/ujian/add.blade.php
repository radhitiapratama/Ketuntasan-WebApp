@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    @php
        function checkTingkatan($tingkatan)
        {
            if ($tingkatan == 1) {
                return 'X';
            }

            if ($tingkatan == 2) {
                return 'XI';
            }

            if ($tingkatan == 3) {
                return 'XII';
            }
        }
    @endphp

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
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form action="/ujian/store" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="#">Nama Siswa</label>
                                    <select name="siswa[]" id="siswa" class="form-control siswa-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($siswas as $siswa)
                                            <option value="{{ $siswa->siswa_id }}">{{ $siswa->nama }}
                                                {{ checkTingkatan($siswa->tingkatan) }} {{ $siswa->nama_kelas }}
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
                    </div>
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
    </script>

    <script>
        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#siswa").select2(configSelect2);
        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);

        let num = 1;

        $("#btn-add").click(function() {
            num++;
            let template_form = `
            <div class="input-wrapper d-flex flex-column mt-3">
                <button type="button" class="btn btn-danger btn-remove ml-auto">X</button>
                <div class="form-group">
                    <label for="#">Nama Siswa</label>
                    <select name="siswa[]" id="siswa-${num}" class="form-control" required>
                        <option value="">Pilih...</option>
                        @foreach ($siswas as $siswa)
                            <option value="{{ $siswa->siswa_id }}">{{ $siswa->nama }}
                                {{ checkTingkatan($siswa->tingkatan) }} {{ $siswa->nama_kelas }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="#">Ruang</label>
                    <select name="ruang[]" id="ruang-${num}" class="form-control " required>
                        <option value="">Pilih...</option>
                        @foreach ($ruangs as $ruang)
                            <option value="{{ $ruang }}">{{ $ruang }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="#">Sesi</label>
                    <select name="sesi[]" id="sesi-${num}" class="form-control " required>
                        <option value="">Pilih...</option>
                        @foreach ($sesis as $sesi)
                            <option value="{{ $sesi }}">{{ $sesi }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            `;

            $(".form-wrapper").append(template_form);

            $(`#siswa-${num}`).select2(configSelect2);
            $(`#ruang-${num}`).select2(configSelect2);
            $(`#sesi-${num}`).select2(configSelect2);
        });

        $(document).on("click", ".btn-remove", function(e) {
            let parent = e.target.parentElement.remove();
        });

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });
    </script>
@endsection

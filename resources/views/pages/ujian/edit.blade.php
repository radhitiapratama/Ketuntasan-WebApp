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
                    <h1 class="page-title">Edit Data Ujian</h1>
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
                            <form action="/ujian/update" method="POST">
                                @csrf
                                <input type="hidden" name="id" value="{{ old('id', $data_ujian->id) }}">
                                <div class="form-group">
                                    <label for="#">Nama Siswa</label>
                                    <input type="text" name="siswa" class="form-control"
                                        value="{{ old('siswa', $data_ujian->nama) }}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="#">Ruang</label>
                                    <select name="ruang" id="ruang" class="form-control ruang-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($ruangs as $ruang)
                                            <option value="{{ $ruang }}" @selected($ruang == old('ruang', $data_ujian->ruang))>
                                                {{ $ruang }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="#">Sesi</label>
                                    <select name="sesi" id="sesi" class="form-control sesi-1" required>
                                        <option value="">Pilih...</option>
                                        @foreach ($sesis as $sesi)
                                            <option value="{{ $sesi }}" @selected($sesi == old('sesi', $data_ujian->sesi))>
                                                {{ $sesi }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button type="submit" class="btn-dark m-auto">
                                    <i class="ri-check-line"></i>
                                    Update
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

        $("#ruang").select2(configSelect2);
        $("#sesi").select2(configSelect2);

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });
    </script>
@endsection

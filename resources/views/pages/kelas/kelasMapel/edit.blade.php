@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Kelas Mapel</h1>
                    <a href="/kelas-mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <form action="/kelas-mapel/update" method="POST">
        @csrf
        <div class="row">
            <div class="col-md-8 col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <label for="tingkatan">Tingkatan</label>
                                            <input type="text" class="form-control" id="tingkatan" disabled
                                                @if ($detail->tingkatan == 1) value="X" @endif
                                                @if ($detail->tingkatan == 2) value="XI" @endif
                                                @if ($detail->tingkatan == 3) value="XII" @endif>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="jurusan">Jurusan</label>
                                            <input type="text" class="form-control" id="jurusan" disabled
                                                value="{{ $detail->nama_jurusan }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="kelas">Kelas</label>
                                            <input type="text" class="form-control" id="kelas" disabled
                                                value="{{ $detail->nama_kelas }}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h5 class="page-title text-left mb-3">Data Kelas Mapel</h5>
                        @foreach ($kelas_mapels as $kelas_mapel)
                            @php
                                $num = $loop->iteration - 1;
                            @endphp

                            <input type="hidden" name="hidden_guru_mapel_id[]" value="{{ $kelas_mapel->guru_mapel_id }}">
                            <input type="hidden" name="hidden_status[]" value="{{ $kelas_mapel->status }}">
                            <input type="hidden" name="hidden_kelas_mapel_id[]" value="{{ $kelas_mapel->kelas_mapel_id }}">

                            <div class="row mb-4" id="wrapper-{{ $loop->iteration }}">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="#">Guru</label>
                                        <input type="text" class="form-control pointer-none" id="guru"
                                            name="guru[]" value="{{ old('guru.' . $num, $kelas_mapel->nama) }}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="#">Mapel</label>
                                        <input type="text" class="form-control pointer-none" id="mapel"
                                            name="mapel[]" value="{{ old('mapel.' . $num, $kelas_mapel->nama_mapel) }}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="#">Kode Guru Mapel</label>
                                        <select name="kode_guru_mapel[]" id="kode_guru_mapel_{{ $loop->iteration }}"
                                            class="form-control select2">
                                            <option value="">Pilih...</option>
                                            @foreach ($guru_mapels as $guru_mapel)
                                                @if ($guru_mapel->kode_guru_mapel == null)
                                                    <option value="{{ $guru_mapel->guru_mapel_id }}"
                                                        {{ old('kode_guru_mapel.' . $num, $kelas_mapel->guru_mapel_id) == $guru_mapel->guru_mapel_id ? 'selected' : '' }}>
                                                        {{ $guru_mapel->kode_guru }}
                                                    </option>
                                                @else
                                                    <option value="{{ $guru_mapel->guru_mapel_id }}"
                                                        {{ old('kode_guru_mapel.' . $num, $kelas_mapel->guru_mapel_id) == $guru_mapel->guru_mapel_id ? 'selected' : '' }}>
                                                        {{ $guru_mapel->kode_guru }},{{ $guru_mapel->kode_guru_mapel }}
                                                    </option>
                                                @endif
                                            @endforeach
                                        </select>
                                        @if ($errors->has('kode_guru_mapel.*'))
                                            @if ($errors->get('kode_guru_mapel.' . $loop->iteration - 1))
                                                <small
                                                    class="text-danger err-message-kodeGuruMapel">{{ array_values($errors->get('kode_guru_mapel.' . $loop->iteration - 1))[0] }}</small>
                                            @endif
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="#">Status</label>
                                        <select name="status[]" id="status_{{ $loop->iteration }}"
                                            class="form-control select2">
                                            @foreach ($statuses as $key => $value)
                                                <option value="{{ $key }}"
                                                    {{ old('status.' . $num, $kelas_mapel->status) == $key ? 'selected' : '' }}>
                                                    {{ $value }}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('status.*'))
                                            @if ($errors->get('status.' . $loop->iteration - 1))
                                                <small
                                                    class="text-danger err-message-kodeGuruMapel">{{ array_values($errors->get('status.' . $loop->iteration - 1))[0] }}</small>
                                            @endif
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn-dark">
                                    <i class="ri-check-line"></i>
                                    Update
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "{{ session('successUpdate') }}",
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

        @if (session()->has('duplicateKodeGuruMapel'))
            Swal.fire({
                title: "{{ session('duplicateKodeGuruMapel') }}",
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

        const csrfToken = $('meta[name="csrf-token"]').attr("content");

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
        };

        // init select2
        const select2 = $(".select2");
        for (let i = 1; i <= select2.length; i++) {
            $(`#kode_guru_mapel_${i}`).select2(configSelect2);
            $(`#status_${i}`).select2(configSelect2);
        }

        $(document).on("change", 'select[name="kode_guru_mapel[]"]', function() {
            const value = $(this).val();
            const parentId = $(this).parent().parent().parent().attr("id");

            const checkErrMessage = $(`#${parentId} .err-message-kodeGuruMapel`);
            if (checkErrMessage) {
                checkErrMessage.remove();
            }

            $.ajax({
                type: "POST",
                url: "{{ url('/getGuruMapelByGuruMapelId') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    guruMapelId: value,
                },
                dataType: "json",
                success: function(response) {
                    if (response.message == "emptyGuruMapelId") {
                        $(`#${parentId} #guru`).val("");
                        $(`#${parentId} #mapel`).val("");
                        return;
                    }

                    $(`#${parentId} #guru`).val(response.data.nama);
                    $(`#${parentId} #mapel`).val(response.data.nama_mapel);
                }
            });
        });
    </script>
@endsection

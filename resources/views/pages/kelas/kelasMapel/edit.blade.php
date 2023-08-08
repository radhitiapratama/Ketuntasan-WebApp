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

    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-10 col-12">
                    <form action="/kelas-mapel/update" method="POST">
                        @csrf

                        <input type="hidden" name="tingkatan_id" value="{{ $tingkatan_id }}">
                        <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                        <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">

                        <div class="row justify-content-center">
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

                        <div class="mapels">
                            @foreach ($kelas_mapels as $kelas_mapel)
                                <input type="hidden" name="kelas_mapel_id[]" value="{{ $kelas_mapel->kelas_mapel_id }}">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group" id="{{ $loop->iteration }}">
                                            <label for="#">Mapel</label>
                                            <select name="mapel_id[]" id="mapel_id_{{ $loop->iteration }}"
                                                class="form-control select-mapel" required>
                                                @foreach ($mapels as $mapel)
                                                    <option value="{{ $mapel->mapel_id }}" @selected($mapel->mapel_id == $kelas_mapel->mapel_id)>
                                                        {{ $mapel->nama_mapel }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group" id="{{ $loop->iteration }}">
                                            <label for="#">Guru</label>
                                            <select name="guru_id[]" id="guru_id_{{ $loop->iteration }}"
                                                class="form-control select-guru" required>
                                                @foreach ($kelas_mapel->guru_mapel_user as $kmUser)
                                                    <option value="{{ $kmUser->user_id }}" @selected($kmUser->user_id == $kelas_mapel->user_id)>
                                                        {{ $kmUser->nama }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="#">Status</label>
                                            <select name="status[]" id="status_{{ $loop->iteration }}"
                                                class="form-control select-status" required>
                                                @foreach ($statuses as $key => $value)
                                                    <option value="{{ $key }}" @selected($key == $kelas_mapel->status)>
                                                        {{ $value }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn-dark m-auto">
                                    <i class="ri-check-line"></i>
                                    Update
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('duplicate'))
            Swal.fire({
                title: "Mapel / Guru mapel tidak boleh duplikat",
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

        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Data kelas berhasil di update",
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
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        const csrfToken = $('meta[name="csrf-token"]').attr("content");

        const configSelect2 = {
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        };

        const selectMapel = $(".select-mapel");
        for (let i = 1; i <= selectMapel.length; i++) {
            $(`#mapel_id_${i}`).select2(configSelect2);
            $(`#guru_id_${i}`).select2(configSelect2);
            $(`#status_${i}`).select2(configSelect2);
        }

        $(document).on("change", '.select-mapel', function() {
            let parentId = $(this).parent().attr("id");
            $(`#guru_id_${parentId}`).html("");
            $(`#guru_id_${parentId}`).attr('disabled', true);

            $.ajax({
                type: "POST",
                url: "/kelas-mapel/getDataGuruByMapel",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    mapel_id: $(this).val(),
                    tingkatan_id: $("input[name='tingkatan_id']").val(),
                    jurusan_id: $("input[name='jurusan_id']").val(),
                    kelas_id: $("input[name='kelas_id']").val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    let opt = `<option value=""></option>`;
                    for (let i = 0; i < response.gurus.length; i++) {
                        opt +=
                            `<option value="${response.gurus[i].user_id}">${response.gurus[i].nama}</option>`;
                    }

                    $(`#guru_id_${parentId}`).attr("disabled", false);
                    $(`#guru_id_${parentId}`).html(opt);
                    return;
                }
            });
        });
    </script>
@endsection

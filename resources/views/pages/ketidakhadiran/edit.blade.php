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
    <script src="{{ asset('js/select2-focus.js') }}"></script>

    <div class="card">
        <div class="card-body d-flex justify-content-end">
            <a href="/ketidakhadiran" class="btn-dark">Kembali</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-body">
                    <form action="/ketidakhadiran/update" method="POST">
                        @csrf
                        <input type="hidden" name="id" value="{{ $data_tidakhadir->id }}">
                        <div class="form-group">
                            <label for="#">Nama Siswa</label>
                            <select name="siswa" id="siswa" class="form-control" required>
                                <option value="">Pilih...</option>
                                @foreach ($siswas as $siswa)
                                    <option value="{{ $siswa->siswa_id }}" @selected($siswa->siswa_id == $data_tidakhadir->siswa_id)>
                                        {{ $siswa->nama }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="#">Ruang</label>
                            <input type="text" name="ruang" id="ruang" class="form-control pointer-none" disabled
                                value="{{ old('ruang', $data_tidakhadir->ruang) }}" required>
                        </div>
                        <div class="form-group">
                            <label for="#">Sesi</label>
                            <input type="text" name="sesi" id="sesi" class="form-control pointer-none" disabled
                                value="{{ old('sesi', $data_tidakhadir->sesi) }}" required>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <label for="#">Alasan</label>
                                <select name="alasan" id="alasan" class="form-control" required>
                                    <option value="">Pilih....</option>
                                    @foreach ($alasans as $key => $value)
                                        <option value="{{ $key }}" @selected($key == $data_tidakhadir->alasan)>
                                            {{ $value }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn-dark">Update</button>
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
    </script>

    <script>
        const csrfToken = $("meta[name='csrf-token']").attr("content");
        const configSelect = {
            theme: "bootstrap4",
            width: "100%"
        }

        $("#siswa").select2(configSelect);
        $("#alasan").select2(configSelect);

        $("#siswa").change(function() {
            let siswa_id = $(this).val();
            $.ajax({
                type: "POST",
                url: "{{ url('ujian/check-siswa') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    siswa_id
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
                }
            });
        });
    </script>
@endsection

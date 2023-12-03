@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>


    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-end">
                    <a href="/ketuntasan/by-guru/{{ $guru_id }}/{{ $mapel_id }}/{{ $tingkatan }}/{{ $kelas_id }}"
                        class="btn-dark">
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
                    <form action="/byGuru/updateKetuntasan" method="POST">
                        @csrf
                        <input type="hidden" name="ketuntasan_id" value="{{ $data->ketuntasan_id }}">
                        <div class="form-group">
                            <label for="#">Siswa</label>
                            <input type="text" class="form-control" id="#" value="{{ $data->nama }}" required>
                        </div>
                        <div class="form-group">
                            <label for="#">Status</label>
                            <select name="status" id="status" class="form-control" required>
                                @foreach ($tuntases as $key => $value)
                                    <option value="{{ $key }}" @selected($key == $data->tuntas)>{{ $value }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="#">Deskripsi</label>
                            <textarea name="deskripsi" id="deskripsi" class="form-control" required>{{ $data->desc }}</textarea>
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
                title: "Ketuntasan berhasil di update",
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

        $("#status").select2(configSelect2);
    </script>
@endsection

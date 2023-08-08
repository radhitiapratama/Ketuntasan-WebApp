@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/toastr/toastr.min.css') }}">

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Ketuntasan</h1>
                    <form action="{{ url('ketuntasan/kelas/siswa') }}" method="post">
                        @csrf
                        <input type="hidden" name="tingkatan" value="{{ $tingkatan }}">
                        <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                        <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                        <input type="hidden" name="user_id" value="{{ $user_id }}">
                        <button type="submit" class="btn-dark">
                            <i class="ri-arrow-left-line"></i>
                            Kembali
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-6 col-12">
                    <form action="{{ url('ketuntasan/update') }}" method="POST">
                        @csrf
                        <input type="hidden" name="ketuntasan_id" value="{{ $ketuntasan->ketuntasan_id }}">
                        <input type="hidden" name="tingkatan" value="{{ $tingkatan }}">
                        <input type="hidden" name="jurusan_id" value="{{ $jurusan_id }}">
                        <input type="hidden" name="kelas_id" value="{{ $kelas_id }}">
                        <input type="hidden" name="user_id" value="{{ $user_id }}">

                        <div class="form-group">
                            <label for="#">Siswa</label>
                            <input type="text" class="form-control" id="siswa" value="{{ $ketuntasan->nama }}"
                                disabled required>
                        </div>
                        <div class="form-group">
                            <label for="#">Status</label>
                            <select name="tuntas" id="tuntas" class="form-control select2" required>
                                @foreach ($tuntases as $key => $value)
                                    <option value="{{ $key }}" @selected($key == $ketuntasan->tuntas)>{{ $value }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="#">Deskripsi</label>
                            <textarea name="deskripsi" id="deskripsi" class="form-control">
                                {{ $ketuntasan->desc }}
                            </textarea>
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

    <script src="{{ asset('plugins/toastr/toastr.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "8000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

        @if (session()->has('successUpdate'))
            toastr['success']("Data Ketuntasan berhasil di update");
        @endif
    </script>

    <script>
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $("#tuntas").select2({
            theme: "bootstrap4",
            width: "100%",
        })
    </script>
@endsection

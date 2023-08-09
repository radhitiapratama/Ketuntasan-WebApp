@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">

    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Edit Tahun Ajaran</h1>
                    <a href="/tahun-ajaran" class="btn-dark">
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
                <div class="col-md-6 col-12">
                    <form action="/tahun-ajaran/update" method="POST">
                        @csrf
                        <input type="hidden" name="tahun_ajaran_id" value="{{ $tahun_ajaran->tahun_ajaran_id }}">
                        <div class="row justify-content-center">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="tahun_start">Tahun</label>
                                    <input type="text" class="form-control" id="tahun_start" name="tahun_start"
                                        value="{{ old('tahun_start', $tahun_start) }}" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="tahun_end">Tahun</label>
                                    <input type="text" class="form-control" id="tahun_end" name="tahun_end"
                                        value="{{ old('tahun_end', $tahun_end) }}" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="#">User</label>
                                    <select name="user_status" id="user_status" class="form-control" required>
                                        @if ($tahun_ajaran->user_aktif == 1)
                                            <option value="1">Aktif</option>
                                        @else
                                            @foreach ($statuses as $key => $value)
                                                <option value="{{ $key }}" @selected($key == $tahun_ajaran->user_aktif)>
                                                    {{ $value }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="#">Superadmin</label>
                                    <select name="superadmin_status" id="superadmin_status" class="form-control" required>
                                        @if ($tahun_ajaran->superadmin_aktif == 1)
                                            <option value="1">Aktif</option>
                                        @else
                                            @foreach ($statuses as $key => $value)
                                                <option value="{{ $key }}" @selected($key == $tahun_ajaran->superadmin_aktif)>
                                                    {{ $value }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
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
    <script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('js/mapel.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Tahun Ajaran berhasil di update",
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

        @if (session()->has('min1Aktif'))
            Swal.fire({
                title: "Minimal ada 1 tahun ajaran yg di aktifkan",
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
        $("#user_status").select2({
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        });

        $("#superadmin_status").select2({
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        });
    </script>
@endsection

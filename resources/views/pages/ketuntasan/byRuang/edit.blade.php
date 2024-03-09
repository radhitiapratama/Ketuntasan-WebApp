@extends('layout.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('js/select2-focus.js') }}"></script>


    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Update Ketuntasan</h1>
                    <a href="/ketuntasan/by-ruang/siswa/{{ $siswa_id }}" class="btn-dark">
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
                    <input type="hidden" name="ketuntasan_id" value="{{ $data->ketuntasan_id }}">
                    <div class="form-group">
                        <label for="#">Guru</label>
                        <input type="text" disabled class="form-control" id="#" value="{{ $data->nama }}"
                            required>
                    </div>
                    <div class="form-group">
                        <label for="#">Mapel</label>
                        <input type="text" disabled class="form-control" id="#" value="{{ $data->nama_mapel }}"
                            required>
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
                    <button type="button" id="btn-edit" class="btn-dark">Update</button>
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

        const csrfToken = $("meta[name='csrf-token']").attr("content");

        function showLoading() {
            Swal.fire({
                title: "Sedang memprosess,",
                text: "Jangan tutup Browser / tekan tombol kembali",
                icon: "info",
                showConfirmButton: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
        }

        function hideLoading() {
            Swal.close();
        }

        $("#btn-edit").click(function() {
            showLoading();
            $.ajax({
                type: "POST",
                url: "{{ url('ketuntasan/update') }}",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    ketuntasan_id: {{ $data->ketuntasan_id }},
                    tuntas: $("#status").val(),
                    deskripsi: $("#deskripsi").val(),
                },
                dataType: "json",
                success: function(response) {
                    if (response.message == 'success') {
                        hideLoading();
                        Swal.fire({
                            title: "Ketuntasan siswa berhasil di update",
                            icon: "success",
                            iconColor: 'white',
                            customClass: {
                                popup: 'colored-toast'
                            },
                            toast: true,
                            position: 'top-right',
                            showConfirmButton: false,
                            timer: 4000,
                            timerProgressBar: true
                        });
                    }
                }
            });
        });
    </script>
@endsection

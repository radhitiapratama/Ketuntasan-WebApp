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
                    <h1 class="page-title">Edit Guru Mapel</h1>
                    <a href="/guru-mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <form action="{{ url('guru-mapel/update') }}" method="post">
        @csrf
        <input type="hidden" name="guru_id" value="{{ $guru->guru_id }}">
        <div class="card">
            <div class="card-header">
                <div class="form-group">
                    <label for="nama_guru">Nama Guru</label>
                    <input type="text" class="form-control" id="nama_guru" disabled value="{{ $guru->nama }}">
                </div>
            </div>
            <div class="card-body">
                @if (count($guruMapels) > 0)
                    <div class="row justify-content-center">
                        @foreach ($guruMapels as $guruMapel)
                            <input type="hidden" name="guru_mapel_id[]" value="{{ $guruMapel->guru_mapel_id }}">

                            <div class="col-md-4 col-12">
                                <div class="form-group">
                                    <label for="mapel_id">Mata Pelajaran</label>
                                    <select name="mapel_id[]" id="mapel_id_{{ $loop->iteration }}"
                                        class="form-control select_mapel_id" required>
                                        <option value="{{ $guruMapel->mapel_id }}" selected>
                                            {{ $guruMapel->nama_mapel }}
                                        </option>
                                        @foreach ($mapels as $mapel)
                                            <option value="{{ $mapel->mapel_id }}">{{ $mapel->nama_mapel }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('mapel_id')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="#">Kode Guru Mapel</label>
                                    <input type="text" class="form-control" name="kode_guru_mapel[]"
                                        value="{{ $guruMapel->kode_guru_mapel }}" onkeypress="return onlyNumberKey(event)"
                                        required>
                                    @error('kode_guru_mapel')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="#">Status</label>
                                    <select name="status[]" id="select_status_{{ $loop->iteration }}" name="status"
                                        class="form-control" required>
                                        @foreach ($statuses as $key => $value)
                                            <option value="{{ $key }}" @selected($guruMapel->status == $key)>
                                                {{ $value }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('status')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <button type="submit" class="btn-dark m-auto">
                                <i class="ri-check-line"></i>
                                Update
                            </button>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </form>

    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>

    <script>
        @if (session()->has('successUpdate'))
            Swal.fire({
                title: "Data guru mapel berhasil di update",
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

        const selectMapelId = $(".select_mapel_id");

        for (let i = 1; i <= selectMapelId.length; i++) {
            $(`#mapel_id_${i}`).select2({
                theme: "bootstrap4",
                width: "100%",
            });

            $(`#select_status_${i}`).select2({
                theme: "bootstrap4",
                width: "100%",
            });
        }

        function onlyNumberKey(evt) {
            var ASCIICode = (evt.which) ? evt.which : evt.keyCode
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                return false;
            return true;
        }
    </script>
@endsection

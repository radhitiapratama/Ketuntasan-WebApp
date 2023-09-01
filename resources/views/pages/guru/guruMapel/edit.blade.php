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
    <div class="card">
        <div class="card-header">
            <div class="form-group">
                <label for="">Nama Guru</label>
                <input type="text" class="form-control" value="{{ $guruMapel->nama }}" disabled>
            </div>
        </div>
        <div class="card-body">
            <form action="{{ '/guru-mapel/update' }}" method="POST">
                @csrf
                <input type="hidden" name="guru_mapel_id" value="{{ $guruMapel->guru_mapel_id }}">
                <input type="hidden" name="guru_id" value="{{ $guruMapel->guru_id }}">
                <div class="form-group">
                    <label for="">Kode Guru Mapel</label>
                    <input type="text" name="kode_guru_mapel" class="form-control"
                        value="{{ old('kode_guru_mapel', $guruMapel->kode_guru_mapel) }}"
                        onkeypress="return onlyNumberKey(event)" required>
                    @error('kode_guru_mapel')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="#">Mapel</label>
                    <select name="mapel_id" id="mapel_id" class="form-control select2 select2-1">
                        @foreach ($mapels as $mapel)
                            <option value="{{ $mapel->mapel_id }}"
                                {{ old('mapel_id', $guruMapel->mapel_id) == $mapel->mapel_id ? 'selected' : '' }}>
                                {{ $mapel->nama_mapel }}
                            </option>
                        @endforeach
                    </select>
                    @error('mapel_id')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="#">Status</label>
                    <select name="status" id="status" class="form-control select2 select2-2">
                        @foreach ($statuses as $key => $value)
                            <option value="{{ $key }}"
                                {{ old('status', $guruMapel->status) == $key ? 'selected' : '' }}>{{ $value }}
                            </option>
                        @endforeach
                    </select>
                    @error('status')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <button type="submit" class="btn-dark">Submit</button>
            </form>
        </div>
    </div>

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

        @if (session()->has('duplicateMapel'))
            Swal.fire({
                title: "{{ session('duplicateMapel') }}",
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

        $(".select2").each(function(i) {
            $(`.select2-${i+1}`).select2({
                theme: "bootstrap4",
                width: "100%",
            });
        });

        function onlyNumberKey(evt) {
            var ASCIICode = (evt.which) ? evt.which : evt.keyCode
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                return false;
            return true;
        }
    </script>
@endsection

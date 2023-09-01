@extends('layout.main')

@section('content')
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/sweetalert2/sweetalert2.min.css') }}">

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-12 d-flex justify-content-end">
                    <a href="/kelas-mapel" class="btn-dark">
                        <i class="ri-arrow-left-line"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 col-12 ">
            <div class="card">
                <div class="card-header py-4">
                    <h3 class="card-title" style="font-weight: bold">Tambah Kelas Mapel</h3>
                </div>
                <div class="card-body">
                    <form action="/kelas-mapel/store" method="POST">
                        @csrf
                        <div class="row mb-3">
                            <div class="col-md-5 col-12 mb-3 mb-md-0">
                                <label for="tingkatan">Tingkatan</label>
                                <select name="tingkatan" id="tingkatan" class="form-control select2 select2-1" required>
                                    <option value="">Pilih..</option>
                                    @foreach ($tingkatans as $key => $value)
                                        <option value="{{ $key }}">{{ $value }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('tingkatan')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="col-md-7 col-12 mb-3 mb-md-0">
                                <label for="kelas">Kelas</label>
                                <select name="kelas" id="kelas" class="form-control select2 select2-2"required>
                                    <option value="">Pilih..</option>
                                    @foreach ($kelases as $kelas)
                                        <option value="{{ $kelas->jurusan->jurusan_id }}|{{ $kelas->kelas_id }}">
                                            {{ $kelas->jurusan->nama_jurusan }} | {{ $kelas->nama_kelas }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('kelas')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                        </div>

                        <div class="kode-guru-mapel-wrapper">
                            <div class="row mb-3">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="#">Kode Guru Mapel</label>
                                        <select name="kode_guru_mapel[]" id="kode_guru_mapel_1" class="form-control">
                                            <option value="">Pilih...</option>
                                            @foreach ($guruMapels as $guruMapel)
                                                <option value="{{ $guruMapel->guru_mapel_id }}">
                                                    @if ($guruMapel->kode_guru_mapel != null)
                                                        {{ $guruMapel->kode_guru }},{{ $guruMapel->kode_guru_mapel }}
                                                    @else
                                                        {{ $guruMapel->kode_guru }}
                                                    @endif
                                                </option>
                                            @endforeach
                                            @error('kode_guru_mapel')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12">
                                <button type="button" class="btn-dark m-auto" id="btn-add-mapel">
                                    <i class="ri-add-box-line"></i>
                                </button>
                            </div>
                        </div>
                        <button type="submit" class="btn-dark">
                            <i class="ri-check-line"></i>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-3 d-none clone-el">
        <div class="col-12">
            <div class="form-group input-wrapper">
                <label for="#">Kode Guru Mapel</label>
                <select name="kode_guru_mapel[]" id="kode_guru_mapel" class="form-control select2">
                    <option value="">Pilih...</option>
                    @foreach ($guruMapels as $guruMapel)
                        <option value="{{ $guruMapel->guru_mapel_id }}">
                            @if ($guruMapel->kode_guru_mapel != null)
                                {{ $guruMapel->kode_guru }},{{ $guruMapel->kode_guru_mapel }}
                            @else
                                {{ $guruMapel->kode_guru }}
                            @endif
                        </option>
                    @endforeach
                </select>
                <button type="button" class="btn-delete-input">
                    <i class="ri-close-circle-line"></i>
                </button>
            </div>
        </div>
    </div>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>

    <script>
        @if (session()->has('successStore'))
            Swal.fire({
                title: "Data Kelas mapel berhasil di tambahkan",
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
        }

        // init select2 untuk select(tingkatan,jurusan,kelas)
        const select2 = document.querySelectorAll(".select2");
        for (let i = 1; i <= select2.length; i++) {
            $(`.select2-${i}`).select2(configSelect2);
        }

        $("#kode_guru_mapel_1").select2(configSelect2);

        // select kelas
        $(".select-kelas").change(function() {
            $("#mapel_id_1").attr("disabled", false);
            $("#btn-add-mapel").removeClass("d-none");
        });

        let countCloneEl = 1;

        // add new element mapel
        $("#btn-add-mapel").click(function() {
            countCloneEl++;
            let cloneElement = $(".clone-el").clone().removeClass("clone-el d-none");

            cloneElement.find("#kode_guru_mapel").attr("id", `kode_guru_mapel_${countCloneEl}`);

            $(".kode-guru-mapel-wrapper").append(cloneElement);
            $(`#kode_guru_mapel_${countCloneEl}`).select2(configSelect2);
        });

        //delete new mapel element
        $(document).on("click", '.btn-delete-input', function() {
            $(this).parent().parent().parent().remove();
        });
    </script>
@endsection

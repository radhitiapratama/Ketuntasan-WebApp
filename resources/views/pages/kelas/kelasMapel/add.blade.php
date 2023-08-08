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
                    <h1 class="page-title">Tambah Kelas Mapel</h1>
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
                    <form action="/kelas-mapel/store" method="POST">
                        @csrf
                        <div class="row mb-3">
                            <div class="col-md-4 col-12 mb-3 mb-md-0">
                                <label for="tingkatan">Tingkatan</label>
                                <select name="tingkatan" id="select2-1" class="form-control select2 select-tingkatan"
                                    required>
                                    <option value=""></option>
                                    @foreach ($tingkatans as $key => $value)
                                        <option value="{{ $key }}">{{ $value }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 col-12 mb-3 mb-md-0">
                                <label for="jurusan">Jurusan</label>
                                <select name="jurusan" id="select2-2" class="form-control select2 select-jurusan" disabled
                                    required>
                                    <option value=""></option>
                                    @foreach ($jurusans as $jurusan)
                                        <option value="{{ $jurusan->jurusan_id }}">{{ $jurusan->nama_jurusan }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 col-12 mb-3 mb-md-0">
                                <label for="kelas">Kelas</label>
                                <select name="kelas" id="select2-3" class="form-control select2 select-kelas" disabled
                                    required>
                                </select>
                            </div>
                        </div>
                        <div class="mapel-wrapper">
                            <div class="row mb-3 justify-content-center">
                                <div class="col-md-5 col-12 mb-3 mb-md-0">
                                    <div class="form-group parent_mapel_1" id="1">
                                        <label for="mapel_id">Nama Mapel</label>
                                        <select name="mapel_id[]" id="mapel_id_1" class="form-control select-mapel" disabled
                                            required>
                                            <option value=""></option>
                                            @foreach ($mapels as $mapel)
                                                <option value="{{ $mapel->mapel_id }}">{{ $mapel->nama_mapel }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-5 col-12 mb-3 mb-md-0">
                                    <div class="form-group parent_guru_1" id="1">
                                        <label for="guru_id">Nama Guru</label>
                                        <select name="guru_id[]" id="guru_id_1" class="form-control select-guru" disabled
                                            required>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12">
                                <button type="button" class="btn-dark m-auto d-none" id="btn-add-mapel">
                                    <i class="ri-add-box-line"></i>
                                </button>
                            </div>
                        </div>
                        <button type="submit" class="btn-dark m-auto">
                            <i class="ri-check-line"></i>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-3 justify-content-center clone-el d-none">
        <div class="col-md-5 col-12 mb-3 mb-md-0">
            <div class="form-group parent-mapel" id="1">
                <label for="mapel_id">Nama Mapel</label>
                <select name="mapel_id[]" id="mapel_id_1" class="form-control select-mapel" required>
                    <option value=""></option>
                    @foreach ($mapels as $mapel)
                        <option value="{{ $mapel->mapel_id }}">{{ $mapel->nama_mapel }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-md-5 col-12 mb-3 mb-md-0">
            <div class="form-group parent-guru input-wrapper" id="1">
                <label for="guru_id">Nama Guru</label>
                <select name="guru_id[]" id="guru_id_1" class="form-control select-guru" disabled required>
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

        // init select2 untuk select(tingkatan,jurusan,kelas)
        const select2 = document.querySelectorAll(".select2");
        for (let i = 1; i <= select2.length; i++) {
            $(`#select2-${i}`).select2({
                theme: "bootstrap4",
                width: "100%",
                placeholder: "Pilih...",
            });
        }

        // select tingkatan
        $(".select-tingkatan").change(function() {
            $(".select-jurusan").removeAttr("disabled");
        });


        // select jurusan
        $(".select-jurusan").change(function() {
            $(".select-kelas").html("");
            $(".select-kelas").attr('disabled', true);

            $.ajax({
                type: "POST",
                url: "/getDataKelasByJurusan",
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                data: {
                    jurusan_id: $(this).val(),
                },
                dataType: "json",
                success: function(response) {
                    let opt = `<option value=""></option>`;
                    for (let i = 0; i < response.kelases.length; i++) {
                        opt +=
                            `<option value="${response.kelases[i].kelas_id}">${response.kelases[i].nama_kelas}</option>`
                    }

                    $(".select-kelas").html(opt);
                    $(".select-kelas").attr('disabled', false);
                }
            });
        });

        // select kelas
        $(".select-kelas").change(function() {
            $("#mapel_id_1").attr("disabled", false);
            $("#btn-add-mapel").removeClass("d-none");
        });

        $("#mapel_id_1").select2({
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        });

        $("#guru_id_1").select2({
            theme: "bootstrap4",
            width: "100%",
            placeholder: "Pilih..."
        });

        //select mapel change
        $(document).on("change", '.select-mapel', function() {
            let parentId = $(this).parent().attr("id"); // get data parent id untuk ambil select guru yg sebaris
            console.log(parentId);
            $(`.parent_guru_${parentId} #guru_id_${parentId}`).html("");
            $(`.parent_guru_${parentId} #guru_id_${parentId}`).attr('disabled', true);

            $.ajax({
                type: "POST",
                url: "/getDataGuruByMapel",
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                data: {
                    mapel_id: $(this).val(),
                },
                dataType: "json",
                success: function(response) {
                    console.log(response);

                    let opt = '<option value=""></option>';
                    for (let i = 0; i < response.gurus.length; i++) {
                        opt +=
                            `<option value="${response.gurus[i].user_id}">${response.gurus[i].nama}</option>`
                    }

                    $(`.parent_guru_${parentId} #guru_id_${parentId}`).html(opt);
                    $(`.parent_guru_${parentId} #guru_id_${parentId}`).select2({
                        theme: "bootstrap4",
                        width: "100%",
                        placeholder: "Pilih...",
                    });

                    $(`.parent_guru_${parentId} #guru_id_${parentId}`).attr('disabled', false);
                }
            });
        });

        let countCloneEl = 1;

        // add new element mapel
        $("#btn-add-mapel").click(function() {
            countCloneEl++;
            let cloneElement = $(".clone-el").clone().removeClass("clone-el d-none");

            // mapel
            cloneElement.find(".parent-mapel").attr("id", countCloneEl);
            cloneElement.find(".parent-mapel").addClass(`parent_mapel_${countCloneEl}`);
            cloneElement.find(".select-mapel").attr("id", `mapel_id_${countCloneEl}`);

            // guru
            cloneElement.find(".parent-guru").attr("id", countCloneEl);
            cloneElement.find(".parent-guru").addClass(`parent_guru_${countCloneEl}`);
            cloneElement.find(".select-guru").attr("id", `guru_id_${countCloneEl}`);

            $(".mapel-wrapper").append(cloneElement);
            $(`#mapel_id_${countCloneEl}`).select2({
                theme: "bootstrap4",
                width: "100%",
                placeholder: "Pilih...",
            });
        });

        //delete new mapel element
        $(document).on("click", '.btn-delete-input', function() {
            $(this).parent().parent().parent().remove();
        });
    </script>
@endsection

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
                    <h1 class="page-title">Tambah Guru Mapel</h1>
                    <a href="/guru-mapel" class="btn-dark">
                        <i class="fa-solid fa-arrow-left"></i>
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form method="POST" id="form">
                                @csrf
                                <div class="form-group">
                                    <label for="guru_id">Nama Guru</label>
                                    <select name="guru_id" id="guru_id" class="form-control select-guru select2" required>
                                        <option value=""></option>
                                        @foreach ($gurus as $guru)
                                            <option value="{{ $guru->guru_id }}">{{ $guru->nama }}</option>
                                        @endforeach
                                    </select>
                                    @error('guru_id')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="mapel_id">Mata Pelajaran</label>
                                    <select name="mapel_id[]" id="mapel_id_1" class="form-control select2 select-mapel"
                                        required>
                                        <option value=""></option>
                                        @foreach ($mapels as $mapel)
                                            <option value="{{ $mapel->mapel_id }}">{{ $mapel->nama_mapel }}</option>
                                        @endforeach
                                    </select>
                                    @error('mapel_id')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="mapel-wrapper">
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn-dark m-auto" id="btn-add-mapel">
                                        <i class="ri-add-circle-line"></i>
                                    </button>
                                </div>
                                <button type="submit" class="btn-dark m-auto" id="btn-submit">
                                    <i class="ri-check-line"></i>
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="el-clone-hidden">
        <div class="form-group input-wrapper d-none">
            <label for="mapel_id">Mata Pelajaran</label>
            <select id="mapel_id_1" class="form-control select2" required>
                <option value=""></option>
                @foreach ($mapels as $mapel)
                    <option value="{{ $mapel->mapel_id }}">{{ $mapel->nama_mapel }}</option>
                @endforeach
            </select>
            <button type="button" class="btn-delete-input">
                <i class="ri-close-circle-line"></i>
            </button>
        </div>
    </div>

    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script>
        const configSelect2 = {
            theme: 'bootstrap4',
            width: '100%',
            placeholder: "Pilih..."
        }

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

        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });

        $(".select-guru").select2(configSelect2)
        $(`#mapel_id_1`).select2(configSelect2);

        const csrfToken = $("meta[name='csrf-token']").attr('content');

        let mapelLen = 1;

        $("#btn-add-mapel").click(function() {
            mapelLen++;

            let newElement = $(".el-clone-hidden").clone().removeClass("el-clone-hidden");
            newElement.find("select").attr("id", `mapel_id_${mapelLen}`);
            newElement.find("select").addClass("select-mapel");
            newElement.find(".form-group").removeClass("d-none")
            newElement.find("select").attr("name", "mapel_id[]");
            newElement.appendTo(".mapel-wrapper");

            $(`#mapel_id_${mapelLen}`).select2(configSelect2);
        });

        $("#btn-submit").click(function(e) {
            e.preventDefault();
            showLoading();

            if ($(".select-guru").val() == null || $(".select-guru").val() == "") {
                Swal.fire({
                    title: "Guru tidak boleh kosong !",
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

            let selectMapel = document.querySelectorAll(".select-mapel");

            for (let i = 0; i < selectMapel.length; i++) {
                if (selectMapel[i].value == null || selectMapel[i].value == "") {
                    Swal.fire({
                        title: "Mapel tidak boleh kosong !",
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
            }

            //tampung data semua mapel yg di pilih ke dalam var mapels karena js tidak bisa mengambil semua valuenya
            let mapels = [];
            let mapelEl = $("select[name='mapel_id[]']").each(function() {
                mapels.push($(this).val());
            });

            $.ajax({
                type: "POST",
                url: "/guru-mapel/store",
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: {
                    mapel_id: mapels,
                    guru_id: $("select[name='guru_id']").val(),
                },
                dataType: "json",
                success: function(response) {
                    hideLoading();

                    if (response.status == false) {
                        Swal.fire({
                            title: "Mapel tidak boleh kosong",
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

                    $(".select2").each(function() {
                        $(this).val("").trigger("change.select2");
                    });

                    $(".mapel-wrapper").html("");

                    Swal.fire({
                        title: "Data guru berhasil di tambahkan",
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
                }
            });
        });

        $(document).on("click", '.btn-delete-input', function() {
            $(this).parent().remove();
        });
    </script>
@endsection

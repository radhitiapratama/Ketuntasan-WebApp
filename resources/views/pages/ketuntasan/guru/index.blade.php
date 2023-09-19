@extends('layout.main')

@section('content')
    <div class="card mb-1">
        <div class="card-body">
            <div class="row">
                <div
                    class="col-12 d-flex justify-content-md-between justify-content-center flex-column flex-md-row align-items-center gap-20">
                    <h1 class="page-title">Data Ketuntasan</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="deadline-container" style="margin: 5px 0">
        <div class="icon">
            <i class="ri-timer-line"></i>
        </div>
        <div class="deadline-body">
            @if ($status_batasWaktu)
                <p>{{ $start_date }} - {{ $end_date }}</p>
            @else
                <p>Belum ada batas waktu</p>
            @endif
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-bordered" id="tbl-ketuntasan" style="width: 100%">
                        <thead>
                            <tr style="border-bottom: none !important">
                                <th width="5px">#</th>
                                <th>Mapel</th>
                                <th width="100px" class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <script>
        function loadDatatable() {
            $("#tbl-ketuntasan").DataTable({
                serverSide: true,
                processing: true,
                ordering: false,
                searching: false,
                info: false,
                ajax: {
                    url: "{{ url('ketuntasan') }}",
                },
                columns: [{
                        data: "no"
                    },
                    {
                        data: "mapel"
                    },
                    {
                        data: "settings"
                    },
                ]
            });
        }

        loadDatatable();
    </script>
@endsection

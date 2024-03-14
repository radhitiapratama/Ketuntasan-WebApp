<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Data Ketidakhadiran</title>
    <style>
        * {
            margin: 0;
            padding: 10px;
            box-sizing: border-box;
        }

        table tr th {
            font-size: 12px;
        }

        table tr td {
            padding: 2px;
            font-size: 10px;
        }

        .text-center {
            text-align: center;
        }

        .title {
            font-size: 16px;
        }

        .text-left {
            text-align: left;
        }

        .info {
            font-size: 12px;
            margin-bottom: -10px;
        }

        .info-cetak {
            font-weight: bold;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <h1 class="title">Data Ketidakhadiran Siswa</h1>
    <p class="info">Tanggal : {{ $tgl_start }} - {{ $tgl_end }}</p>
    <p class="info">Ruang : {{ $ruang ? $ruang : '-' }} </p>
    <p class="info">Sesi : {{ $sesi ? $sesi : '-' }} </p>
    <p class="info-cetak">Tanggal Waktu Cetak : {{ date('d-m-Y H:m:s') }}</p>
    <table width="100%" border="1" cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th width="5">#</th>
                <th>Siswa</th>
                <th>Kelas</th>
                <th width="5">Ruang</th>
                <th width="5">Sesi</th>
                <th>Alasan</th>
                <th>Waktu</th>
                <th width="5">Semester</th>
            </tr>
        </thead>
        <tbody>
            @if (count($ketidakhadirans) > 0)
                @foreach ($ketidakhadirans as $row)
                    <?php
                    
                    $tingkatan = \App\Models\Utils::checkTingkatan($row->tingkatan);
                    $alasan = \App\Models\Utils::checkAlasanTidakHadir($row->alasan);
                    ?>

                    <tr>
                        <td class="text-center">{{ $loop->iteration }}</td>
                        <td>{{ $row->nama }}</td>
                        <td>{{ $tingkatan }} {{ $row->nama_kelas }}</td>
                        <td class="text-center">{{ $row->ruang }}</td>
                        <td class="text-center">{{ $row->sesi }}</td>
                        <td>{{ $alasan }}</td>
                        <td>{{ date('d-m-Y H:m:s', strtotime($row->created_at)) }}</td>
                        <td class="text-center">{{ $row->semester }}</td>
                    </tr>
                @endforeach
            @else
                <tr>
                    <td colspan="8" class="text-center">Tidak ada data Siswa tidak hadir</td>
                </tr>
            @endif
        </tbody>
    </table>
</body>

</html>

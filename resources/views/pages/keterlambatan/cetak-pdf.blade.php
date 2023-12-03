<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Data Keterlambatan</title>
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
    <h1 class="title">Data Keterlambatan Siswa</h1>
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
                <th>Alasan Terlambat</th>
                <th>Tidak Lanjut</th>
            </tr>
        </thead>
        <tbody>
            @if (count($keterlambatans) > 0)
                @foreach ($keterlambatans as $row)
                    <?php
                    
                    $tingkatan = \App\Models\Utils::checkTingkatan($row->tingkatan);
                    $tidak_lanjut = \App\Models\Utils::checkTidakLanjut($row->tidak_lanjut);
                    ?>

                    <tr>
                        <td class="text-center">{{ $loop->iteration }}</td>
                        <td>{{ $row->nama }}</td>
                        <td>{{ $tingkatan }} {{ $row->nama_kelas }}</td>
                        <td class="text-center">{{ $row->ruang }}</td>
                        <td class="text-center">{{ $row->sesi }}</td>
                        <td>{{ $row->alasan_terlambat }}</td>
                        <td>{{ $tidak_lanjut }}</td>
                    </tr>
                @endforeach
            @else
                <tr>
                    <td colspan="7" class="text-center">Tidak ada data Siswa terlambat</td>
                </tr>
            @endif


        </tbody>
    </table>
</body>

</html>

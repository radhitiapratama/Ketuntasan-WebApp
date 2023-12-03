<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Data Ketuntasan</title>
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
    <h1 class="title">Data Ketuntasan</h1>
    <p class="info">Guru : {{ $nama_guru }}</p>
    <p class="info">Mapel : {{ $nama_mapel }} </p>
    <p class="info">Kelas : {{ $nama_kelas }}</p>
    <p class="info-cetak">Tanggal Waktu Cetak : {{ date('d-m-Y H:m:s') }}</p>
    <table width="100%" border="1" cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th width="5">#</th>
                <th>Siswa</th>
                <th width="40">Status</th>
                <th>Deskripsi</th>
                <th width="5">Tgl Tuntas</th>
                <th width="5">Semester</th>
            </tr </thead>
        <tbody>
            @if (count($ketuntasans) > 0)
                @foreach ($ketuntasans as $row)
                    <tr>
                        <td class="text-center">{{ $loop->iteration }}</td>
                        <td>{{ $row->nama }}</td>
                        <td class="text-center">
                            @if ($row->tuntas == 1)
                                Tuntas
                            @else
                                Belum Tuntas
                            @endif
                        </td>
                        <td>
                            @if ($row->desc)
                                {{ $row->desc }}
                            @else
                                -
                            @endif
                        </td>
                        <td>
                            @if ($row->tgl_tuntas)
                                {{ $row->tgl_tuntas }}
                            @else
                                -
                            @endif
                        </td>
                        <td class="text-center">{{ $row->semester }}</td>
                    </tr>
                @endforeach
            @else
                <tr>
                    <td colspan="6" class="text-center">Tidak ada data Ketuntasan</td>
                </tr>
            @endif

        </tbody>
    </table>
</body>

</html>

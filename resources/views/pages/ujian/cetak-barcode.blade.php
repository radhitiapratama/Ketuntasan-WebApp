<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="{{ asset('main-assets/imgs/logo.png') }}" type="image/x-icon">
    <title>QR Code Siswa</title>
    <style>
        * {
            margin: 0;
        }

        body {
            padding: 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .box {
            border: 1px solid grey;
            padding: 10px;
            font-size: 10px;
            border-radius: 5px;
        }

        .text {
            margin-top: 5px;
        }

        h5 {
            padding: 0;
            margin: 0;
        }

        .info-wrapper {
            margin-bottom: 12px;
        }

        .info {
            font-size: 12px;
        }
    </style>
</head>

<body>
    <p class="info">Ruang : {{ $ruang }}</p>
    <p class="info">Sesi : {{ $sesi }}</p>
    <br>
    @php
        $nomer = 1;
    @endphp
    <div class="container">
        <table width="100%">
            <tr>
                @foreach ($ujians as $row)
                    @php
                        $tingkatan = App\Models\Utils::checkTingkatan($row->tingkatan);
                    @endphp
                    <td class="box">
                        <div class="text">
                            <?php
                            echo DNS2D::getBarcodeHTML(strval($row->id), 'QRCODE', 3, 3);
                            ?>
                            <div class="text">
                                <h5>{{ $row->nama }}</h5>
                                <h5>{{ $tingkatan }} | {{ $row->nama_kelas }}</h5>
                            </div>
                        </div>
                    </td>

                    @if ($nomer++ % 5 == 0)
            </tr>
            <tr>
                @endif
                @endforeach
            </tr>
        </table>
    </div>
</body>

</html>

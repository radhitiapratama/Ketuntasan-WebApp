<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        @foreach ($data as $row)
            <div class="form-group">
                <label for="">Nama Mapel</label>
                <select name="" id="" class="form-control">
                    <option value="">{{ $row->nama_mapel }}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="#">User</label>
                {{-- {{ $row->guru_mapel_user->nama }} --}}
                <select name="" id="" class="form-control">
                    @foreach ($row->guru_mapel_user as $u)
                        <option value="{{ $u->nama }}">{{ $u->nama }}</option>
                    @endforeach
                </select>
            </div>
        @endforeach
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script>
</body>

</html>

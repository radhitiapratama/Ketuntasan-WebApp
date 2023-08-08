<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    {{-- Remix Icon --}}
    <link rel="stylesheet" href="{{ asset('plugins/remixIcon/fonts/remixicon.css') }}">
</head>

<body>
    <div class="container">
        <div class="col-left">
            <img src="{{ asset('imgs/login-img.png') }}" alt="login-image" class="login-img">
        </div>
        <div class="col-right">
            <form action=" {{ url('login') }}" method="post" class="wrapper">
                @csrf
                <h1 style="text-align: center">Silahkan Login</h1>
                <h3 style="text-align: center;">Selamat Datang di ketuntasan </h3>
                <div class="input-wrapper">
                    <div class="input-box">
                        <i id="" class="ri-user-line"></i>
                        <input class="input" type="text" name="username" placeholder="Username">
                        <span></span>
                    </div>
                    <div class="input-box">
                        <i id="icon" class="ri-lock-line"></i>
                        <input type="password" name="password" placeholder="Password" class="input-pass">
                        <i id="show-pass" class="ri-eye-line"></i>
                        <span></span>
                    </div>
                </div>
                <button type="submit" class="btn-login">
                    Login
                </button>
            </form>
        </div>
    </div>
    <script src="{{ asset('js/login.js') }}"></script>
</body>

</html>

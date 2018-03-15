<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" type="text/css">

        <!-- Styles -->
        <style>
            body {
                font-family: "Varela Round", sans-serif;
                margin: 0;
                padding: 0;
                background: radial-gradient(#f2f2f2, #45a6b3);
            }

            .container {
                display: flex;
                height: 100vh;
                align-items: center;
                justify-content: center;
            }

            .content {
                text-align: center;
            }

            .logo {
                margin-right: 40px;
                margin-bottom: 20px;
            }

            .links a {
                font-size: 1.25rem;
                text-decoration: none;
                color: white;
                margin: 10px;
            }

            @media all and (max-width: 500px) {

                .links {
                    display: flex;
                    flex-direction: column;
                }
            }
        </style>
    </head>
    
    <body>
        <div class="container">
            <div class="content">
                <div class="logo">
                    <img src="{{ asset('img/logo.png') }}" height="300" alt="Index Labs TZ Company Limited">
                </div>

                <div class="links">
                    <a href="/botman/tinker">
                        Test on the Web
                    </a>

                    <a href="{{ route('login') }}">
                        Login
                    </a>

                    <a href="https://www.messenger.com/t/1452245748218037" target="_blank">
                        Messenger
                    </a>

                    <a href="http://indexlabs.co.tz" target="_blank">
                        Index Labs
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
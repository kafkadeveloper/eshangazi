<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'eShangazi') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/floating-labels.css') }}" rel="stylesheet">
</head>
<body>
<div id="app">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">
                {{ config('app.name', 'eShangazi') }}
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                    <a href="" class="nav-link">Linnk</a>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link">Linnk</a>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link">Linnk</a>
                  </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item dropdown pull-right">
                            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Hakika Juma
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a href="#" class="dropdown-item"
                                   onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                    Logout
                                </a>

                                <form id="logout-form" action="#" method="POST"
                                      style="display: none;">
                                </form>
                            </div>
                        </li>
                </ul>
            </div>

        </div>
    </nav>

    <div class="container-fluid h-100">
    <div class="row h-100">
        <div class="col-2 collapse d-md-flex bg-faded pt-2 h-100" id="sidebar">
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="#">Overview</a></li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#submenu1" data-toggle="collapse" data-target="#submenu1">Reports</a>
                    <div class="collapse" id="submenu1" aria-expanded="false">
                        <ul class="flex-column pl-2 nav">
                            <li class="nav-item"><a class="nav-link py-0" href="">Orders</a></li>
                            <li class="nav-item">
                                <a class="nav-link collapsed py-0" href="#submenu1sub1" data-toggle="collapse" data-target="#submenu1sub1">Customers</a>
                                <div class="collapse small" id="submenu1sub1" aria-expanded="false">
                                    <ul class="flex-column nav pl-4">
                                        <li class="nav-item">
                                            <a class="nav-link p-0" href="">
                                                <i class="fa fa-fw fa-clock-o"></i> Daily
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link p-0" href="">
                                                <i class="fa fa-fw fa-dashboard"></i> Dashboard
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link p-0" href="">
                                                <i class="fa fa-fw fa-bar-chart"></i> Charts
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link p-0" href="">
                                                <i class="fa fa-fw fa-compass"></i> Areas
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Analytics</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Export</a></li>
            </ul>
        </div>
        <div class="col pt-2">
            <h2>
                <a href="" data-target="#sidebar" data-toggle="collapse" class="hidden-md-up"><i class="fa fa-bars"></i></a>
                Content
            </h2>
            <h6 class="hidden-sm-down">Shrink page width to see sidebar collapse</h6>
            <p>3 wolf moon retro jean shorts chambray sustainable roof party. Shoreditch vegan artisan Helvetica. Tattooed Codeply Echo Park Godard kogi, next level irony ennui twee squid fap selvage. Meggings flannel Brooklyn literally small batch, mumblecore
                PBR try-hard kale chips. Brooklyn vinyl lumbersexual bicycle rights, viral fap cronut leggings squid chillwave pickled gentrify mustache. 3 wolf moon hashtag church-key Odd Future. Austin messenger bag normcore, Helvetica Williamsburg
                sartorial tote bag distillery Portland before they sold out gastropub taxidermy Vice.</p>
        </div>
    </div>
</div>
</div>

<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>

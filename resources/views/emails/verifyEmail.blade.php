@component('mail::message')
# Welcome to eShangazi {{$user['name']}}

Your registered email is {{$user['email']}} , Please click on the below link to verify your eShangazi account.
@component('mail::button', ['url' => 'http://eshangazi.test/user/verify/'.$user->verifyUser->token])
Click here to verify your accout.
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent

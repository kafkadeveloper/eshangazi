<?php

Route::get('/', function () {
    return view('welcome');
});

Route::match(['get', 'post'], '/botman', 'BotManController@handle');
Route::get('/botman/tinker', 'BotManController@tinker');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();
Route::get('/user/verify/{token}', 'Auth\RegisterController@verifyUser');

Route::view('/test', 'test');
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/doctor/register', 'DoctorController@create')->name('create.doctor');
Route::post('/doctor/register', 'DoctorController@store')->name('store.doctor');
Route::get('/doctor/edit/{id}', 'DoctorController@edit')->name('edit.doctor');
Route::patch('/doctor/update/{id}', 'DoctorController@update')->name('update.doctor');
Route::get('/doctor/show/{id}', 'DoctorController@show')->name('show.doctor');
Route::get('/doctor/index', 'DoctorController@index')->name('index.doctor');
Route::delete('/doctor/destroy/{id}', 'DoctorController@destroy')->name('destroy.doctor');


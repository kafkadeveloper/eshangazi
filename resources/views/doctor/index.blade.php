@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-user-md fa-2x" style="color:#7CB9E8"></i> List of Doctors</h5>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
              </div>
            @endif

            @if($doctors->isEmpty())

            @else
            <div class="table-responsive">
              <table class="table">
              <thead class="thead-light">
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">Name</th>
                  <th scope="col">Gender</th>
                  <th scope="col">Speciality</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Email</th>
                  <th scope="col">Location</th>
                  <th scope="col">Options</th>
                </tr>
              </thead>
              <tbody>
                @foreach($doctors as $doctor)
                <tr>
                  <th scope="row">{{$loop->iteration}}</th>
                  <td>{{$doctor->name}}</td>
                  <td>{{$doctor->gender}}</td>
                  <td>{{$doctor->speciality}}</td>
                  <td>{{$doctor->phone}}</td>
                  <td>{{$doctor->email}}</td>
                  <td>{{$doctor->location}}</td>
                  <td>
                    <div class="btn-group" role="group" aria-label="Options group">
                      <a href="#" type="button" class="btn btn-success btn-sm">view</a>
                      <a href="{{route('edit.doctor', $doctor->id)}}" type="button" class="btn btn-primary btn-sm">edit</a>
                      <a href="#" type="button" class="btn btn-danger btn-sm">delete</a>
                    </div>
                  </td>
                </tr>
                @endforeach
              </tbody>
              </table>
            </div>
            @endif
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

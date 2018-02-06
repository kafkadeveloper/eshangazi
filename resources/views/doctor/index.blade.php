@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-user-md fa-lg" style="color:#7CB9E8"></i> List of Experts</h5>
          <hr>
            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
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
                    <form method="POST" action="{{ route('destroy.doctor',$doctor->id) }}">
                      {{ csrf_field() }}
                      {{ method_field('DELETE') }}
                      <div class="btn-group" role="group" aria-label="Options group">
                      <a href="{{ route('show.doctor',$doctor->id) }}" title="View expert info" class="btn btn-success btn-sm">
                        View
                      </a>
                      <a href="{{ route('edit.doctor',$doctor->id) }}" title="Edit expert info" class="btn btn-warning btn-sm">
                        Edit
                      </a>
                      <button type="submit" title="Delete expert" class="btn btn-danger btn-sm">
                        Delete
                      </button>
                      </div>
                    </form>
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

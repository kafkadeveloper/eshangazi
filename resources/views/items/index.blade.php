@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-1">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-list-ol fa-lg" style="color:#7CB9E8"></i> Items <a href="{{ route('create.item') }}" title="Add new" class="btn btn-primary btn-sm float-right"><i class="far fa-plus-square fa-lg"></i> Add</a></h5>
          <hr>
          
          @if (session('status'))
            <div class="alert alert-success">
              {{ session('status') }}
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          @endif
          
          @if($items->isEmpty())
            <p class="text-danger"> No Item added at the moment.</p>
            <a href="{{ route('create.item') }}" class="btn btn-primary">Click here to add new Item </a>
          @else
          <div class="table-responsive">
            <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">No.</th>
                <th scope="col">Title</th>
                <th scope="col">Descreption</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Category</th>
                <th scope="col">Options</th>
              </tr>
            </thead>
            <tbody>
              @foreach($items as $item)
              <tr>
                <th scope="row">{{$loop->iteration}}</th>
                <td>{{$item->title}}</td>
                <td>{{$item->description}}</td>
                <td>{{$item->age}}</td>
                <td>{{$item->gender}}</td>
                <td>{{$item->item_category->name}}</td>
                <td>
                  <form method="POST" action="{{ route('destroy.item',$item->id) }}">
                    {{ csrf_field() }}
                    {{ method_field('DELETE') }}
                    <div class="btn-group" role="group" aria-label="Options group">
                    <a href="{{ route('edit.item',$item->id) }}" title="Edit item info" class="btn btn-primary btn-sm">
                      View
                    </a>
                    <a href="{{ route('edit.item',$item->id) }}" title="Edit item info" class="btn btn-warning btn-sm">
                      Edit
                    </a>
                    <button type="submit" title="Delete Item" class="btn btn-danger btn-sm">
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

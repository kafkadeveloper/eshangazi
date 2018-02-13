@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-1">
    <div class="col-sm-7">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-list-ol fa-lg" style="color:#7CB9E8"></i> Item Categories</h5>
          <hr>
          
          @if (session('status'))
            <div class="alert alert-success">
              {{ session('status') }}
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          @endif
          
          @if($item_categories->isEmpty())
            <p class="text-danger"> No Item Category added at the moment.</p>
          @else
          <div class="table-responsive">
            <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">No.</th>
                <th scope="col">Name</th>
                <th scope="col">Descreption</th>
                <th scope="col">Options</th>
              </tr>
            </thead>
            <tbody>
              @foreach($item_categories as $category)
              <tr>
                <th scope="row">{{$loop->iteration}}</th>
                <td>{{$category->name}}</td>
                <td>{{$category->description}}</td>
                <td>
                  <form method="POST" action="{{ route('destroy.item-category',$category->id) }}">
                    {{ csrf_field() }}
                    {{ method_field('DELETE') }}
                    <div class="btn-group" role="group" aria-label="Options group">
                    <a href="{{ route('edit.item-category',$category->id) }}" title="Edit category info" class="btn btn-warning btn-sm">
                      Edit
                    </a>
                    <button type="submit" title="Delete Item Category" class="btn btn-danger btn-sm">
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
    <div class="col-sm-5">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-plus-square fa-lg" style="color:#7CB9E8"></i> Add new item category</h5>
          <hr>

            <!-- Item Category reg form -->
            {!! Form::open(['url' => 'item-categories/create', 'method' => 'POST']) !!}
            
            <div class="form-label-group">
              <input type="text" name="name" 
                            id="itemName" value="{{old('name')}}" 
                            class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" placeholder="Full name" 
                            required autofocus>
              <label for="itemName">Item Name</label>

              @if ($errors->has('name'))
                <div class="invalid-feedback">
                  <strong>{{ $errors->first('name') }}</strong>
                </div>
              @endif
            </div>
            <div class="form-group">
              <label for="description">Description</label>
              <textarea name="description" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" 
                        id="description" rows="3">{{old('description')}}</textarea>

              @if ($errors->has('description'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('description') }}</strong>
								</div>
              @endif
            </div>

            <button class="btn btn-lg btn-primary" type="submit">Save</button>
          {!! Form::close() !!}
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

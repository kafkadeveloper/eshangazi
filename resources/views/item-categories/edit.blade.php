@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-1">
    <div class="col-sm-8">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="fas fa-edit fa-lg" style="color:#28a745"></i> Editing Item Category</h5>
          <hr>
          
          @if (session('status'))
            <div class="alert alert-success">
              {{ session('status') }}
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          @endif
          {!! Form::open(['route' => ['update.item-category', $item_category->id], 'method' => 'PATCH']) !!}
            
            <div class="form-label-group">
              <input type="text" name="name" 
                            id="itemName" value="{{$item_category->name}}" 
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
                        id="description" rows="3">{{$item_category->description}}</textarea>

              @if ($errors->has('description'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('description') }}</strong>
								</div>
              @endif
            </div>

            <button class="btn btn-lg btn-success" type="submit">Update</button>
          {!! Form::close() !!}
        </div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> <i class="far fa-times-circle fa-lg" style="color:#7CB9E8"></i> Cancel editing item category</h5>
          <hr>
          <p class="card-text">You can cancel or if done editing by clicking the button below.</p>
          <a href="{{route('index.item-category')}}" class="btn btn-primary">Go to Item Categories list.</a>
            
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

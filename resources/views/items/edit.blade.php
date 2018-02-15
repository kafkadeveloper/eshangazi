@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-1">
    <div class="col-md-7">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><i class="far fa-edit fa-lg" style="color:#7CB9E8"></i> Editing Item info <a href="{{ route('index.item') }}" title="Cancel editing" class="btn btn-secondary btn-sm float-right"><i class="fas fa-times fa-lg"></i> Cancel</a></h5>
          <hr>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            @endif

            <!-- Edit form -->
            {!! Form::open(['route' => ['update.item', $item->id], 'method' => 'PATCH',]) !!}
            
            <div class="form-group">
              <label>Choese Category <span style="color:red;"> *</span></label>
              <select name="item_category_id" class="form-control{{ $errors->has('item_category_id') ? ' is-invalid' : '' }}" title="Select Category" required autofocus>
                <option value=""> Select Category </option>
                @foreach($item_categories as $category)
                  <option value="{{$category->id}}" {{ $item->item_category_id == $category->id ? "selected":"" }}>
                    {{ $category->name }}
                  </option>
                @endforeach
              </select>
            
                @if ($errors->has('item_category_id'))
                  <div class="invalid-feedback">
                          <strong>{{ $errors->first('item_category_id') }}</strong>
                  </div>
                @endif
            </div>
            <div class="form-label-group">
              <input type="text" name="title" 
                            id="inTitle" value="{{$item->title}}" 
                            class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}" placeholder="Enter Title" 
                            required>
              <label for="inTitle">Title</label>

              @if ($errors->has('title'))
                <div class="invalid-feedback">
                  <strong>{{ $errors->first('title') }}</strong>
                </div>
              @endif
            </div>
            <div class="form-group">
              <label for="description">Description</label>
              <textarea name="description" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" 
                        id="description" rows="3">{{$item->description}}</textarea>

              @if ($errors->has('description'))
								<div class="invalid-feedback">
									<strong>{{ $errors->first('description') }}</strong>
								</div>
              @endif
            </div>
            <div class="form-label-group">
              <input type="text" name="age" 
                      id="inputAge" value="{{$item->age}}" 
                      class="form-control{{ $errors->has('age') ? ' is-invalid' : '' }}" 
                      placeholder="Enter age" required>
              <label for="inputAge">Enter age</label>

              @if ($errors->has('age'))
								<div class="invalid-feedback">
									<strong>{{ $errors->first('age') }}</strong>
								</div>
              @endif
            </div>
            <div class="form-group">
            <label for="gender">Chose gender</label>
              <div class="form-check">
                <input class="form-check-input{{ $errors->has('gender') ? ' is-invalid' : '' }}" type="radio" name="gender" id="gender" value="Male" {{ $item->gender == "Male" ? "checked":"" }}>
                <label class="form-check-label" for="gender">
                  Male
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="fgender" value="Female" {{ $item->gender == "Female" ? "checked":"" }}>
                <label class="form-check-label" for="fgender">
                  Female
                </label>
              </div>
              @if ($errors->has('gender'))
                <div class="invalid-feedback">
                    <strong>{{ $errors->first('gender') }}</strong>
                </div>
              @endif
            </div>

            <button class="btn btn-lg btn-success" type="submit">Save changes</button>
          {!! Form::close() !!}
        </div>
      </div>
    </div>
    <div class="col-md-5">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><i class="far fa-edit fa-lg" style="color:#7CB9E8"></i>Change/Upload Image <a href="{{ route('index.item') }}" title="Cancel editing" class="btn btn-secondary btn-sm float-right"><i class="fas fa-times fa-lg"></i> Cancel</a></h5>
          <hr>
          @if (session('image'))
            <div class="alert alert-success">
              {{ session('image') }}
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          @endif

          @if(is_null($item->thumbnail))
            <!-- Image upload -->
            <p class="lead">No image Upload one below.</p>
            {!! Form::open(['route' => ['upload.item', $item->id], 'method' => 'PATCH', 'files' => true]) !!}
            
            <div class="form-group">
              <input type="file" name="thumbnail" id="thumbnail" 
                      class="form-control-file{{ $errors->has('thumbnail') ? ' is-invalid' : '' }}">
              
              @if ($errors->has('thumbnail'))
                <div class="invalid-feedback">
                    <strong>{{ $errors->first('thumbnail') }}</strong>
                </div>
              @endif
            </div>

            <button class="btn btn-success" type="submit">Save image</button>
          {!! Form::close() !!}
          @else
            <!-- Image change-->
            <p class="lead">Item Image</p>
            <img src="{{asset('storage/'.$item->thumbnail)}}" class="img-fluid img-thumbnail" alt="Item image" style="width: 100% \9;"></img>

            <p class="lead">Change Image below.</p>
            {!! Form::open(['route' => ['upload.item', $item->id], 'method' => 'PATCH', 'files' => true]) !!}
            
              <div class="form-group">
                <input type="file" name="thumbnail" id="thumbnail" 
                        class="form-control-file{{ $errors->has('thumbnail') ? ' is-invalid' : '' }}">
                
                @if ($errors->has('thumbnail'))
                  <div class="invalid-feedback">
                      <strong>{{ $errors->first('thumbnail') }}</strong>
                  </div>
                @endif
              </div>

              <button class="btn btn-success" type="submit">Save changes</button>
            {!! Form::close() !!}
          @endif
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

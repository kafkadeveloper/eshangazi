@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-1">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><i class="far fa-plus-square fa-lg" style="color:#7CB9E8"></i> Adding New Item <a href="{{ route('index.item') }}" title="Cancel editing" class="btn btn-primary btn-sm float-right"><i class="fas fa-list-alt fa-lg"></i> Item List</a></h5>
          <hr>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            @endif

            <!-- Create item form -->
            {!! Form::open(['url' => 'items/create', 'method' => 'POST', 'files' => true]) !!}
            
            <div class="form-group">
              <label>Choese Category <span style="color:red;"> *</span></label>
              <select name="item_category_id" class="form-control{{ $errors->has('item_category_id') ? ' is-invalid' : '' }}" title="Select Category" required autofocus>
                <option value=""> Select Category </option>
                @foreach($item_categories as $category)
                  <option value="{{$category->id}}" {{ old("item_category_id") == $category->id ? "selected":"" }}>
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
                            id="inTitle" value="{{old('title')}}" 
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
                        id="description" rows="3">{{old('description')}}</textarea>

              @if ($errors->has('description'))
								<div class="invalid-feedback">
									<strong>{{ $errors->first('description') }}</strong>
								</div>
              @endif
            </div>
            <div class="form-label-group">
              <input type="text" name="age" 
                      id="inputAge" value="{{old('age')}}" 
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
                <input class="form-check-input{{ $errors->has('gender') ? ' is-invalid' : '' }}" type="radio" name="gender" id="gender" value="Male" {{ old('gender') == "Male" ? "checked":"" }}>
                <label class="form-check-label" for="gender">
                  Male
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="fgender" value="Female" {{ old('gender') == "Female" ? "checked":"" }}>
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
            <div class="form-group">
              <label for="thumbnail">Select image to upload.</label>
              <input type="file" name="thumbnail" id="thumbnail" 
                      class="form-control-file{{ $errors->has('thumbnail') ? ' is-invalid' : '' }}">
              
              @if ($errors->has('thumbnail'))
                <div class="invalid-feedback">
                    <strong>{{ $errors->first('thumbnail') }}</strong>
                </div>
              @endif
            </div>

            <button class="btn btn-lg btn-primary" type="submit">Register</button>
          {!! Form::close() !!}
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

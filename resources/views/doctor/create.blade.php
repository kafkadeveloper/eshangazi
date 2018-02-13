@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Register SRH Expert</h5>
          <hr>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            @endif

            <!-- Doctor reg form -->
            {!! Form::open(['url' => 'doctor/register', 'method' => 'POST']) !!}
            
            <div class="form-label-group">
              <input type="text" name="name" 
                            id="inputName" value="{{old('name')}}" 
                            class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" placeholder="Full name" 
                            required autofocus>
              <label for="inputName">Full name</label>

              @if ($errors->has('name'))
                <div class="invalid-feedback">
                  <strong>{{ $errors->first('name') }}</strong>
                </div>
              @endif
            </div>
            <div class="form-label-group">
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
            <label>Speciality <span style="color:red;"> *</span></label>
            <select name="speciality" class="form-control{{ $errors->has('speciality') ? ' is-invalid' : '' }}" title="Select speciality">
              <option value=""> Select speciality </option>
              @foreach($specialities as $speciality)
								<option value="{{$speciality->name}}" {{ old("speciality") == $speciality->name ? "selected":"" }}>
									{{ $speciality->name }} - {{$speciality->description}}
								</option>
              @endforeach
            </select>
          
              @if ($errors->has('speciality'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('speciality') }}</strong>
								</div>
              @endif
          </div>

            <div class="form-label-group">
              <input type="email" name="email" value="{{old('email')}}" id="inputEmail" 
                      class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" 
                      placeholder="Email address" required>
              <label for="inputEmail">Email address</label>

              @if ($errors->has('email'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('email') }}</strong>
								</div>
              @endif
            </div>

            <div class="form-label-group{{ $errors->has('phone') ? ' is-invalid' : '' }}">
              <input type="text" name="phone" value="{{old('phone')}}" id="phone" class="form-control" placeholder="Phone number" required>
              <label for="phone">Phone number</label>

              @if ($errors->has('phone'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('phone') }}</strong>
								</div>
              @endif
            </div>
            <div class="form-label-group">
              <input type="text" name="location" value="{{old('location')}}" id="location"
                     class="form-control{{ $errors->has('location') ? ' is-invalid' : '' }}" placeholder="Location" required>
              <label for="location">Location</label>

              @if ($errors->has('location'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('location') }}</strong>
								</div>
              @endif
            </div>
            <div class="form-group">
              <label for="bio">Bio</label>
              <textarea name="bio" class="form-control{{ $errors->has('bio') ? ' is-invalid' : '' }}" 
                        id="bio" rows="3">{{old('bio')}}</textarea>

              @if ($errors->has('bio'))
								<div class="invalid-feedback">
												<strong>{{ $errors->first('bio') }}</strong>
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

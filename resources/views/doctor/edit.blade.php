@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><i class="fas fa-edit fa-lg" style="color:#7CB9E8"></i> Edit Expert Information</h5>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            @endif

            <!-- Doctor reg form -->
            {!! Form::open(['route' => ['update.doctor', $doctor->id], 'method' => 'POST']) !!}
            {{ method_field('PATCH') }}
            
            <div class="form-label-group{{ $errors->has('name') ? ' has-error' : '' }}">
              {!! Form::text('name',$doctor->name, ['class'=>'form-control','id'=>'inputName', 'placeholder'=>'Full name', 'required']) !!}
              <label for="inputName">Full name</label>

              @if ($errors->has('middle_name'))
                <span class="help-block">
                  <strong>{{ $errors->first('name') }}</strong>
                </span>
              @endif
            </div>
            <div class="form-label-group{{ $errors->has('gender') ? ' has-error' : '' }}">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="gender" value="Male" {{ $doctor->gender == "Male" ? "checked":"" }}>
                <label class="form-check-label" for="gender">
                  Male
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="fgender" value="Female" {{ $doctor->gender == "Female" ? "checked":"" }}>
                <label class="form-check-label" for="fgender">
                  Female
                </label>
              </div>
              @if ($errors->has('gender'))
                <span class="help-block">
                    <strong>{{ $errors->first('gender') }}</strong>
                </span>
              @endif
            </div>
            <div class="form-group{{ $errors->has('speciality') ? ' invalid-feedback' : '' }}">
            <label>Speciality <span style="color:red;"> *</span></label>
            <select name="speciality" class="form-control" title="Select speciality">
              <option value=""> Select speciality </option>
              @foreach($specialities as $speciality)
								<option value="{{$speciality->name}}" {{ $doctor->speciality == $speciality->name ? "selected":"" }}>
									{{ $speciality->name }}
								</option>
              @endforeach
            </select>
          
              @if ($errors->has('speciality'))
								<span class="help-block">
												<strong>{{ $errors->first('speciality') }}</strong>
								</span>
              @endif
          </div>

            <div class="form-label-group{{ $errors->has('email') ? ' has-error' : '' }}">
              {!! Form::text('email',$doctor->email, ['class'=>'form-control','id'=>'inputEmail', 'placeholder'=>'Email address', 'required']) !!}
              <label for="inputEmail">Email address</label>

              @if ($errors->has('email'))
								<span class="help-block">
												<strong>{{ $errors->first('email') }}</strong>
								</span>
              @endif
            </div>

            <div class="form-label-group{{ $errors->has('phone') ? ' has-error' : '' }}">
              {!! Form::text('phone',$doctor->phone, ['class'=>'form-control','id'=>'phone', 'placeholder'=>'Phone number', 'required']) !!}
              <label for="phone">Phone number</label>

              @if ($errors->has('phone'))
								<span class="help-block">
												<strong>{{ $errors->first('phone') }}</strong>
								</span>
              @endif
            </div>
            <div class="form-label-group{{ $errors->has('location') ? ' has-error' : '' }}">
              {!! Form::text('location',$doctor->location, ['class'=>'form-control','id'=>'location', 'placeholder'=>'Location', 'required']) !!}
              <label for="location">Location</label>
              
              @if ($errors->has('location'))
								<span class="help-block">
												<strong>{{ $errors->first('locatiuon') }}</strong>
								</span>
              @endif
            </div>
            <div class="form-group{{ $errors->has('bio') ? ' has-error' : '' }}">
              <label for="bio">Bio</label>
              {!! Form::textarea('bio',$doctor->bio, ['class'=>'form-control', 'rows'=>'3', 'required']) !!}

              @if ($errors->has('bio'))
								<span class="help-block">
												<strong>{{ $errors->first('bio') }}</strong>
								</span>
              @endif
            </div>

            <button class="btn btn-lg btn-success" type="submit">Save Changes</button>
          {!! Form::close() !!}
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

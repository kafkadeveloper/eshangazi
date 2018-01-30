@extends('layouts.dashboard')

@section('content')
<div class="container">
  <div class="row mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Register Doctor</h5>

            @if (session('status'))
              <div class="alert alert-success">
                {{ session('status') }}
              </div>
            @endif

            <!-- Doctor reg form -->
          <form class="form-signin">
            
            <div class="form-label-group">
              <input type="text" name="name" id="inputName" class="form-control" placeholder="Full name" required autofocus>
              <label for="inputName">Full name</label>
            </div>
            <div class="form-label-group">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="gender" value="Male">
                <label class="form-check-label" for="gender">
                  Male
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="fgender" value="Female">
                <label class="form-check-label" for="fgender">
                  Female
                </label>
              </div>
            </div>

            <div class="form-label-group">
              <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required>
              <label for="inputEmail">Email address</label>
            </div>

            <div class="form-label-group">
              <input type="text" name="phone" id="phone" class="form-control" placeholder="Phone number" required>
              <label for="phone">Phone number</label>
            </div>
            <div class="form-label-group">
              <input type="text" name="location" id="location" class="form-control" placeholder="Location" required>
              <label for="location">Location</label>
            </div>
            <div class="form-group">
              <label for="bio">Bio</label>
              <textarea name="bio" class="form-control" id="bio" rows="3"></textarea>
            </div>
            <div class="form-group">
              <label for="speciality">Speciality</label>
              <select class="form-control">
                <option>Doctor</option>
                <option>Default select</option>
              </select>
            </div>

            <button class="btn btn-lg btn-primary" type="submit">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

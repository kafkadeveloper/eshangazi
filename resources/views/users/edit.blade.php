@extends('layouts.app')

@section('content')
<div class="card-body">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">
            Edit User
        </h1>

        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group">
                <a href="{{ route('index-user') }}" class="btn btn-sm btn-outline-secondary">
                    Users List
                </a>
            </div>
        </div>
    </div>    
    
    <form method="POST" action="{{ route('update-user', $user) }}">
        @csrf
        @method('PATCH')

        <div class="form-group">
            <label for="name">
                Name
            </label>

            <input id="name" name="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" 
                value="{{ $user->name }}" placeholder="Name" required autofocus>

            @if ($errors->has('name'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('name') }}</strong>
                </span>
            @endif
        </div>

        <div class="form-group">
            <label for="name">
               Email
            </label>

            <input id="email" name="email" type="text" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                   value="{{ $user->email }}" placeholder="Name" required autofocus>

            @if ($errors->has('email'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
            @endif
        </div>

        <div class="form-group">
            <label for="roles_ids">
               Attach/Change(Role).
            </label>

            <select  id="roles_ids" name="roles_ids[]" type="text" class="form-control" multiple="multiple">
                <option value="">--Choose Role--</option>

                @foreach($roles as $role)
                        @if($user->roles)
                                @if(in_array($role->id, $roles_ids))
                                    @foreach($user->roles as $rolesingle)
                                        @if($role->id == $rolesingle->id)
                                            <option value="{{ $role->id }}" selected="selected">{{ $role->name }}</option>
                                            @endif
                                        @endforeach
                                    @else
                                     <option value="{{ $role->id }}">{{ $role->name }}</option>
                                 @endif
                        @else
                            <option value="{{ $role->id }}">{{ $role->name }}</option>
                        @endif
                @endforeach

            </select>

            @if ($errors->has('roles_ids'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('roles_ids') }}</strong>
                </span>
            @endif
        </div>

        <div class="form-group">
            <label for="role">
                Attach/Change(Permission).
            </label>
            <br/>
            <div class="row">
            @foreach($permissions as $permission)
                <div class="col-3">
                    @if($user->permissions)
                        @if(in_array($permission->id, $permissions_ids))
                            @foreach($user->permissions as $singlep)
                                @if($permission->id == $singlep->id)
                                <input id="role" name="permissions_ids[]" type="checkbox" value="{{ $permission->id }}" checked="checked"> &nbsp;{{ $permission->name }}
                                @endif
                            @endforeach
                            @else
                            <input id="role" name="permissions_ids[]" type="checkbox" value="{{ $permission->id }}"> &nbsp;{{ $permission->name }}
                            @endif
                        @else
                            <input id="role" name="permissions_ids[]" type="checkbox" value="{{ $permission->id }}"> &nbsp;{{ $permission->name }}
                        @endif
                </div>
             @endforeach
            </div>
        </div>

        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mt-3 border-top">
            <h1 class="h2">
                &nbsp;
            </h1>

            <div class="btn-toolbar mb-2 mb-md-0">
                <button type="submit" class="btn btn-primary mt-3">Update</button>
            </div>
        </div> 
    </form>
</div>
@endsection

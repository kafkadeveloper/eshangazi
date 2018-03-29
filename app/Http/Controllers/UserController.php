<?php

namespace App\Http\Controllers;
use App\Permission;
use App\Role;
use App\User;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::paginate(5);
        return view('users.index', ['users' => $users]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  User $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return view('users.show', ['user' => $user]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  User $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $roles = Role::all();
        $permissions_ids = array();
        $roles_ids = $user->roles->pluck('id')->toArray();
        $permissions_ids = $user->permissions->pluck('id')->toArray();
        $permissions = Permission::all();
        return view('users.edit', ['user'=> $user, 'roles' => $roles, 'permissions' => $permissions, 'permissions_ids' => $permissions_ids, 'roles_ids' => $roles_ids]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  User $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);
        //getting the ids for the new roles to be assigned
        $role_ids = $request->get('roles_ids');
        if($role_ids) {
            foreach($user->roles as $role){
                $user->detachRole($role);
            }
            foreach($role_ids as $role){
                $user->attachRole($role);
            }
        }

//        $permission_ids = $request->get('permissions_ids');
//        if($permission_ids){
//            foreach($user->permissions as $permission){
//                $user->detachPermission($permission);
//            }
//            foreach($permission_ids as $permission){
//                $user->attachPermission($permission);
//            }
//        }

        return redirect()->route('index-user');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

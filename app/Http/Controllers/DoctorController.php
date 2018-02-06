<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Doctor;
use App\Speciality;

class DoctorController extends Controller
{
    /**
     * @var Doctor
     */
    private $doctor;

    /**
     * Constructor to initialize object
     *
     * @param Doctor $doctor
     */
    public function __construct(Doctor $doctor)
    {
        $this->middleware('auth');
        $this->doctor = $doctor;
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $doctors = Doctor::all();
        return view('doctor.index', compact('doctors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $specialities = Speciality::all('id', 'name', 'description');
        return view('doctor.create', compact('specialities'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'gender' => 'required',
            'speciality' => 'required',
            'email' => 'required|email|unique:doctors,email',
            'phone' => 'required',
            'location' => 'required',
            'bio' => 'required'
        ]);

        $doctor = new Doctor();

        $doctor->name = $request->get('name');
        $doctor->gender = $request->get('gender');
        $doctor->speciality = $request->get('speciality');
        $doctor->email = $request->get('email');
        $doctor->phone = $request->get('phone');
        $doctor->location = $request->get('location');
        $doctor->bio = $request->get('bio');
        
        $doctor->save();
        return redirect()->back()
                        ->with('status','Expert added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $doctor = $this->doctor->findOrFail($id);
        $specialities = Speciality::all('id', 'name', 'description');
        return view('doctor.edit', compact('doctor', 'specialities'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string',
            'gender' => 'required',
            'speciality' => 'required',
            'email' => 'required|email|unique:doctors,email,'.$id,
            'phone' => 'required',
            'location' => 'required',
            'bio' => 'required'
        ]);

        $doctor = $this->doctor->findOrFail($id);

        $doctor->name = $request->get('name');
        $doctor->gender = $request->get('gender');
        $doctor->speciality = $request->get('speciality');
        $doctor->email = $request->get('email');
        $doctor->phone = $request->get('phone');
        $doctor->location = $request->get('location');
        $doctor->bio = $request->get('bio');
        
        $doctor->save();
        return redirect()->back()
                        ->with('status','Changes saved successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $doctor = $this->doctor->findOrFail($id);
        $doctor->delete();
        return back()->with('status', 'Expert deleted!');
    }
}

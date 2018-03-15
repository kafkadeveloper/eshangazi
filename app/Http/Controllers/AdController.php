<?php

namespace App\Http\Controllers;

use App\Ad;
use App\Partner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdController extends Controller
{
    /**
     * Ad Contoller constructor
     * 
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ads = Ad::paginate(10);

        return view('ads.index', ['ads' => $ads]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $partners = Partner::all('id', 'name');

        return view('ads.create', ['partners' => $partners]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * 
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $thumbnail_path = env("APP_URL") . '/img/logo.jpg'; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/ad-thumbnails'));

        Ad::create([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'minimum_age'   => $request->minimum_age ? $request->minimum_age : 13,
            'gender'        => $request->gender,
            'mode'          => $request->mode,
            'starts'        => $request->starts,
            'ends'          => $request->ends,
            'partner_id'    => $request->partner_id,
            'created_by'    => auth()->id()
        ]);

        return back(); 
    }

    /**
     * Display the specified resource.
     *
     * @param  Ad  $ad
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(Ad $ad)
    {
        return view('ads.show', ['ad' => $ad]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Ad  $ad
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(Ad $ad)
    {
        $partners = Partner::all('id', 'name');

        return view('ads.edit', [
            'ad'        => $ad,
            'partners'  => $partners
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Ad  $ad
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ad $ad)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/ad-thumbnails'));

        $ad->update([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'minimum_age'   => $request->minimum_age ? $request->minimum_age : 13,
            'gender'        => $request->gender,
            'mode'          => $request->mode,
            'starts'        => $request->starts,
            'ends'          => $request->ends,
            'partner_id'    => $request->partner_id,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-ad', $ad); 
    }

    /**
     * Upload the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function upload(Request $request, Ad $ad)
    {
        $request->validate([
            'thumbnail' => 'required|image|mimes:jpeg,jpg,bmp,png||max:2048'
        ]);

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $ext = $thumbnail->getClientOriginalExtension();
            $file_name = "ad_".time().".".$ext;
            $path = $request->thumbnail->storeAs('images/ads', $file_name);

            /*--Deleting image if exist---*/
            if(!is_null($ad->thumbnail))
            {
                Storage::delete($ad->thumbnail);
            }
            $ad->thumbnail = $path;
            $ad->updated_by = auth()->id();

            $ad->update();
            return redirect()->back()->with('image', 'Image uploaded successfully');
        }

        return redirect()->back()->with('image', 'Something went wrong with image.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Ad  $ad
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ad $ad)
    {
        $ad->delete();

        return back();
    }

    /**
     * Return proper URI for thumbnail.
     *
     * @param  String $path
     * 
     * @return String
     */
    public function getThumbnailPath($path)
    {
        return substr($path, 7);
    }
}

<?php

namespace App\Http\Controllers;

use App\Center;
use App\Service;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    /**
     * Service Controller constructor.
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
        $services = Service::paginate(10);

        return view('services.index', ['services' => $services]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $centers = Center::all('id', 'name');
        
        return view('services.create', ['centers' => $centers]);
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
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/service-thumbnails'));

        Service::create([
            'name'          => $request->name,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'center_id'     => $request->center_id,
            'created_by'    => auth()->id()
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Service  $service
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(Service $service)
    {
        return view('services.show', ['service' => $service]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Service  $service
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(Service $service)
    {
        $centers = Center::all('id', 'name');

        return view('services.edit', [
            'service'   => $service,
            'centers'   => $centers,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Service  $service
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Service $service)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/service-thumbnails'));

        $service->update([
            'name'          => $request->name,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path ? $thumbnail_path : $service->thumbnail,
            'center_id'     => $request->center_id,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-service', $service);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Service  $service
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(Service $service)
    {
        $service->delete();

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

    /**
     * Display Generic Template .
     *
     * @param  BotMan $bot
     * 
     * @return void
     */
    public function showBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();        
        $apiReply = $extras['apiReply'];

        $name = $extras['apiParameters']['whitelabel-services'];

        $service = Service::where('name', '=', $name)->first();

        $bot->typesAndWaits(1);
        $bot->reply($service->name);

        $bot->typesAndWaits(1);
        $bot->reply($service->description);
    }
}

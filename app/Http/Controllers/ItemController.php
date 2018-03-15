<?php

namespace App\Http\Controllers;

use App\Item;
use App\ItemCategory;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class ItemController extends Controller
{
    /**
     * Item Controller constructor
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
        $items = Item::paginate(5);

        return view('items.index', ['items' => $items ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $item_categories = ItemCategory::all('id', 'name');

        return view('items.create', ['item_categories' => $item_categories]);
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
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/item-thumbnails'));
        
        Item::create([
            'title'             => $request->title,
            'description'       => $request->description,
            'thumbnail'         => $thumbnail_path,
            'gender'            => $request->gender,
            'minimum_age'       => $request->minimum_age,
            'item_category_id'  => $request->item_category_id,
            'created_by'        => auth()->id()
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  Item $item
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(Item $item)
    {
        return view('items.show', ['item' => $item]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Item $item
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(Item $item)
    {
        $item_categories = ItemCategory::all('id', 'name');

        return view('items.edit', [
            'item'              => $item, 
            'item_categories'   => $item_categories
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Item $item
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Item $item)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/item-thumbnails'));

        $item->update([
            'title'             => $request->title,
            'description'       => $request->description,
            'thumbnail'         => $thumbnail_path,
            'gender'            => $request->gender,
            'minimum_age'       => $request->minimum_age,
            'item_category_id'  => $request->item_category_id,
            'updated_by'        => auth()->id()
        ]);

        return redirect()->route('show-item', $item);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Item $item
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(Item $item)
    {
        $item->delete();

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
     * Delete thumbnail file.
     *
     * @param  String $thumbnail
     * 
     * @return void
     */
    public function deleteFile($thumbnail)
    {        
        if(! is_null($thumbnail))
            Storage::delete($item->thumbnail);
    }

    /**
     * Upload the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * 
     * @return \Illuminate\Http\Response
     */
    public function upload(Request $request, $id)
    {
        $request->validate([
            'thumbnail' => 'required|image|mimes:jpeg,jpg,bmp,png||max:2048'
        ]);

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $ext = $thumbnail->getClientOriginalExtension();
            $file_name = "item_".time().".".$ext;
            $path = $request->thumbnail->storeAs('images/items', $file_name);

            $item = $this->item->findOrFail($id);
            /*--Deleting image if exist---*/
            if(!is_null($item->thumbnail))
            {
                Storage::delete($item->thumbnail);
            }
            $item->thumbnail = $path;
            $item->updated_by = Auth::user()->id;

            $item->update();
            return redirect()->back();
        }

        return back();
    }

    public function showBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();        
        $apiReply = $extras['apiReply'];

        $title = $extras['apiParameters']['whitelabel-items'];

        $item = Item::where('title', '=', $title)->first();

        $bot->typesAndWaits(1);
        $bot->reply($item->title);

        $bot->typesAndWaits(1);
        $bot->reply($item->description);
    }
}

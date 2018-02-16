<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Item;
use App\ItemCategory;
use Auth;

class ItemController extends Controller
{
    /**
     * @var Item
     */
    private $item;

    /**
     * Contructor to initiolize object
     * 
     * @param Item $item
     */
    public function __construct(Item $item)
    {
        $this->middleware('auth');
        $this->item = $item;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = $this->item->all();
        return view('items.index', compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $item_categories = ItemCategory::all('id', 'name');
        return view('items.create', compact('item_categories'));
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
            'item_category_id' => 'required|numeric',
            'title' => 'required|unique:items|max:255',
            'description' => 'required',
            'age' => 'required|numeric',
            'gender' => 'required',
            'thumbnail' => 'image|mimes:jpeg,jpg,bmp,png||max:2048'
        ]);
        
        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $ext = $thumbnail->getClientOriginalExtension();
            $file_name = "item_".time().".".$ext;
            $path = $request->thumbnail->storeAs('images/items', $file_name);

            $item = new Item();
            $item->item_category_id = $request->get('item_category_id');
            $item->title = $request->get('title');
            $item->description = $request->get('description');
            $item->age = $request->get('age');
            $item->gender = $request->get('gender');
            $item->thumbnail = $path;

            $item->save();
            return redirect()->back()->with('status', 'Item added successfully');
        }
        /*--This will be executed if no image file detected--*/
        $item = new Item();
        $item->item_category_id = $request->get('item_category_id');
        $item->title = $request->get('title');
        $item->description = $request->get('description');
        $item->age = $request->get('age');
        $item->gender = $request->get('gender');
        $item->created_by = Auth::user()->id;
        $item->updated_by = Auth::user()->id;

        $item->save();
        return redirect()->back()->with('status', 'Item added successfully, without image.');
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
        $item = $this->item->findOrFail($id);
        $item_categories = ItemCategory::all('id', 'name');
        return view('items.edit', compact('item', 'item_categories'));
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
            'item_category_id' => 'required|numeric',
            'title' => 'required|unique:items|max:255',
            'description' => 'required',
            'age' => 'required|numeric',
            'gender' => 'required'
        ]);

        $item = $this->item->findOrFail($id);
        $item->item_category_id = $request->get('item_category_id');
        $item->title = $request->get('title');
        $item->description = $request->get('description');
        $item->age = $request->get('age');
        $item->gender = $request->get('gender');
        $item->updated_by = Auth::user()->id;

        $item->update();
        return redirect()->back()->with('status', 'Item updated successfully.');
    }

    /**
     * Upload the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
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
            return redirect()->back()->with('image', 'Image uploaded successfully');
        }

        return redirect()->back()->with('image', 'Something went wrong with image.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = $this->item->findOrFail($id);
        /*---Deleting image file--*/
        if(! is_null($item->thumbnail))
        {
            Storage::delete($item->thumbnail);
        }
        $item->delete();
        return redirect()->back()->with('status', 'Item deleted!');
    }
}

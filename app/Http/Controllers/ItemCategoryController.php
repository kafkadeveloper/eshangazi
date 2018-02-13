<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ItemCategory;
use Auth;

class ItemCategoryController extends Controller
{
    /**
     * @var ItemCategory
     */
    private $item_category;

    /**
     * Contractor to initioalize object
     * 
     * @param ItemCategory $item_category
     */
    public function __construct(ItemCategory $item_category)
    {
        $this->middleware('auth');
        $this->item_category = $item_category;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $item_categories = $this->item_category->all();
        return view('item-categories.index', compact('item_categories'));
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
        $request->validate([
            'name' => 'required|string',
            'description' => 'required'
            ]);
        
        $category = new ItemCategory();

        $category->name = $request->get('name');
        $category->description = $request->get('description');
        $category->created_by = Auth::user()->id;
        $category->updated_by = Auth::user()->id;
        
        $category->save();
        return redirect()->route('index.item-category')
                        ->with('status','Item Category saved!');
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
        $item_category = $this->item_category->findOrFail($id);
        return view('item-categories.edit', compact('item_category'));
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
            'description' => 'required'
            ]);

        $category = $this->item_category->findOrFail($id);
        $category->name = $request->get('name');
        $category->description = $request->get('description');
        $category->updated_by = Auth::user()->id;

        $category->update();
        return redirect()->back()->with('status', 'Item Category is updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = $this->item_category->findOrFail($id);
        $category->delete();
        return redirect()->back()->with('status', 'Item Category deleted!');
    }
}

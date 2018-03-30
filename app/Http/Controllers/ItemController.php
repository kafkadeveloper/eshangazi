<?php

namespace App\Http\Controllers;

use App\Item;
use App\Member;
use App\Conversation;
use App\ItemCategory;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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
        $items = Item::paginate(10);

        return view('items.index', ['items' => $items ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $items = Item::all('id', 'title');
        $item_categories = ItemCategory::all('id', 'name');

        return view('items.create', [
            'items'             => $items,
            'item_categories'   => $item_categories
        ]);
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
        $thumbnail_path = null;

        if ($request->hasFile('thumbnail'))
        {
            $thumbnail_path = Storage::disk('s3')
                ->putFile('public/item-thumbnails', $request->file('thumbnail'), 'public');
        }
        
        Item::create([
            'title'             => $request->title,
            'description'       => $request->description,
            'thumbnail'         => $thumbnail_path,
            'gender'            => $request->gender,
            'minimum_age'       => $request->minimum_age,
            'item_category_id'  => $request->item_category_id,
            'item_id'           => $request->item_id,
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

        $items = Item::all('id', 'title');
        $item_categories = ItemCategory::all('id', 'name');

        return view('items.edit', [
            'item'              => $item,
            'items'             => $items,
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
        {
            $thumbnail_path = Storage::disk('s3')
                ->putFile('public/item-thumbnails', $request->file('thumbnail'), 'public');

            $this->destroy($item);
        }

        $item->update([
            'title'             => $request->title,
            'description'       => $request->description,
            'thumbnail'         => $thumbnail_path ? $thumbnail_path : $item->thumbnail,
            'gender'            => $request->gender,
            'minimum_age'       => $request->minimum_age,
            'item_category_id'  => $request->item_category_id,
            'item_id'           => $request->item_id,
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
        if(Storage::disk('s3')->exists($item->thumbnail))
            Storage::disk('s3')->delete($item->thumbnail);

        $item->delete();

        return back();
    }

    /**
     * Show particular Item requested by a member.
     *
     * @param BotMan $bot
     *
     * @return void
     */
    public function showBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();

        $title = $extras['apiParameters'][env('APP_ACTION') . '-items'];

        $item = Item::where('title', '=', $title)->first();

        //$bot->typesAndWaits(1);
        //$bot->reply($item->title);

        $bot->typesAndWaits(1);
        if($item)
        {
            $bot->reply($item->description);
        }
        else{
            $bot->reply('Sorry say that again...Item issue');
        }
        

        $member = Member::where('user_platform_id', '=', $bot->getUser()->getId())->first();

        if($member)
        {
            Conversation::create([
                'intent'    => $title,
                'member_id' => $member->id
            ]);
        }
    }
}

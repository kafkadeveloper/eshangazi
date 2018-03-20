<?php

namespace App\Http\Controllers;

use App\Member;
use App\Conversation;
use App\ItemCategory;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class ItemCategoryController extends Controller
{
    /**
     * Item category constructor
     * 
     */
    public function __construct()
    {
        $this->middleware('auth')->except('showBotMan');
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $item_categories = ItemCategory::paginate(10);

        return view('item-categories.index', [
                'item_categories' => $item_categories
            ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('item-categories.create');
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
                ->putFile('public/item-category-thumbnails', $request->file('thumbnail'), 'public');

        }

        ItemCategory::create([
            'name'          => $request->name,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'created_by'    => auth()->id()
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  ItemCategory $item_category
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(ItemCategory $item_category)
    {
        return view('item-categories.show', ['item_category' => $item_category]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  ItemCategory $item_category
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(ItemCategory $item_category)
    {
        return view('item-categories.edit', ['item_category' => $item_category]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  ItemCategory $item_category
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ItemCategory $item_category)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
        {
            $thumbnail_path = Storage::disk('s3')
                ->putFile('public/item-category-thumbnails', $request->file('thumbnail'), 'public');
        }

        $item_category->update([
            'name'          => $request->name,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path ? $thumbnail_path : $item_category->thumbnail,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-item-category', $item_category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  ItemCategory $item_category
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(ItemCategory $item_category)
    {
        if(Storage::disk('s3')->exists($item_category->thumbnail))
            Storage::disk('s3')->delete($item_category->thumbnail);

        $item_category->delete();

        return back();
    }

    /**
     * Shows a particular Item Category on Messenger Application
     *
     * @param BotMan $bot
     */
    public function showBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();

        $name = $extras['apiParameters'][env('APP_ACTION') . '-item-categories'];

        $category = ItemCategory::with('items')->where('name', '=', $name)->first();

        $bot->typesAndWaits(1);
        $bot->reply($category->description);

        $bot->typesAndWaits(1);
        $bot->reply($this->items($category));

//        $user = $bot->getUser();
//        $user_id = $user->getId();
//
//        $member = Member::where('user_platform_id', '=', $user_id)->first();
//
//        (new Conversation())->record($name, $member->id);
    }

    /**
     * Show a list of Items found for a particular category in a Generic Template.
     *
     * @param $category
     *
     * @return \BotMan\Drivers\Facebook\Extensions\GenericTemplate
     */
    public function items($category)
    {                           
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($category->items as $item)
        {
            $url = $item->thumbnail
                ? (env('AWS_URL') . '/' . $item->thumbnail)
                : (env('APP_URL') . '/img/logo.jpg');

            $template_list->addElements([
                Element::create($item->title)
                    ->subtitle($item->description)
                    ->image($url)
                    ->addButton(ElementButton::create('View Details')
                        ->payload($item->title)->type('postback'))
            ]);
        } 

        return $template_list;
    }
}

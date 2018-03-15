<?php

namespace App\Http\Controllers;

use App\ItemCategory;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
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
        $item_categories = ItemCategory::paginate(5);

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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $thumbnail_path = env("APP_URL") . '/img/logo.jpg'; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/item-category-thumbnails'));

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
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/item-thumbnails'));

        $item_category->update([
            'name'          => $request->name,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-item-category', $item_category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  ItemCategory $item_category
     * @return \Illuminate\Http\Response
     */
    public function destroy(ItemCategory $item_category)
    {
        $item_category->delete();

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


    public function showBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();        
        $apiReply = $extras['apiReply'];

        $name = $extras['apiParameters']['whitelabel-item-categories'];

        $category = ItemCategory::with('items')->where('name', '=', $name)->first();

        $bot->typesAndWaits(1);
        $bot->reply($category->description);

        $bot->typesAndWaits(2);
        $bot->reply($this->items($category));

        $this->conversation();
    }

    public function items($category)
    {                           
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($category->items as $item)
        {
            $template_list->addElements([
                Element::create($item->title)
                    ->subtitle($item->description)
                    ->image('https://white-label-bot.herokuapp.com/img/demo.jpg')
                    ->addButton(ElementButton::create('View Details')
                        ->payload($item->title)->type('postback'))
            ]);
        } 

        return $template_list;
    }

    public function conversation()
    {
        $user = $bot->getUser();

        $member = Member::where('user_platform_id', '=', $user->getId());

        if($member)
        {
            Conversation::create([
                'intent'    => $extras['apiIntent'],
                'member_id' => $member->id
            ]);
        }
    }
}

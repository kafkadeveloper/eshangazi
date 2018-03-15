<?php

namespace App\Http\Controllers;

use App\Member;
use App\Message;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use BotMan\Drivers\Facebook\FacebookDriver;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\BotMan\Messages\Attachments\Location;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Outgoing\OutgoingMessage;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class MessageController extends Controller
{
    /**
     * Messsage Controller constructor.
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
        $messages = Message::paginate(3);

        return view('messages.index', ['messages' => $messages]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('messages.create');
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
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/message-thumbnails'));

        Message::create([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'gender'        => $request->gender,
            'minimum_age'   => $request->minimum_age ? $request->minimum_age : 13,
            'created_by'    => auth()->id()
        ]);

        return back(); 
    }

    /**
     * Display the specified resource.
     *
     * @param  Message $message
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(Message $message)
    {
        return view('messages.show', ['message' => $message]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Message $message
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(Message $message)
    {
        return view('messages.edit', ['message' => $message]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Message $message
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Message $message)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/message-thumbnails'));

        $message->update([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path ? $thumbnail_path : $message->thumbnail,
            'gender'        => $request->gender,
            'minimum_age'   => $request->minimum_age ? $request->minimum_age : 13,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-message', $message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Message $message
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(Message $message)
    {
        $message->delete();

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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Message $message
     * 
     * @return \Illuminate\Http\Response
     */
    public function publish(Request $request, Message $message)
    {      
        $bot = app('botman');

        $members = Member::all();

        foreach($members as $member)
        {
            $bot->say($this->message($message), $member->user_platform_id, FacebookDriver::class);
        }

        $message->update([
            'status'        => 'publish',
            'updated_by'    => auth()->id()
        ]);
        
        return back();
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

        $title = $extras['apiParameters']['whitelabel-messages'];

        $bot->typesAndWaits(1);
        $bot->reply($apiReply);  

        $message = Message::with('details')->where('title', '=', $title)->first();            
            
        $bot->typesAndWaits(1);        

        if($message)
        {
            $bot->reply($this->details($message));
        }
        else
        {            
            $user = $bot->getUser();
            $bot->reply('Hey ' . $user->getFirstName() . ', something went wrong, you can proceed with something else while my team fixing this issue.');
        }        
    }

    /**
     * Message Generic Template.
     *
     * @param  Message $message
     * 
     * @return BotMan\Drivers\Facebook\Extensions\GenericTemplate
     */
    public function message($message)
    {
        $message = GenericTemplate::create()
                    ->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL)
                    ->addElements([
                        Element::create($message->title)
                            ->subtitle($message->description)
                            ->image('https://white-label-bot.herokuapp.com/img/demo.jpg')
                            ->addButton(ElementButton::create('View Details')
                                ->payload($message->title)->type('postback'))
                    ]);

        return $message;
    }

    /**
     * Details Generic Template.
     *
     * @param  Message $message
     * 
     * @return BotMan\Drivers\Facebook\Extensions\GenericTemplate
     */
    public function details($message)
    {                           
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($message->details as $detail)
        {
            $template_list->addElements([
                Element::create($detail->title)
                    ->subtitle($detail->description)
                    ->image('https://white-label-bot.herokuapp.com/img/demo.jpg')
                    ->addButton(ElementButton::create('View Details')
                        ->payload($detail->title)->type('postback'))
            ]);
        } 

        return $template_list;
    }
}

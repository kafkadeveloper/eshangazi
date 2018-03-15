<?php

namespace App\Http\Controllers;

use App\Message;
use App\MessageDetail;
use Illuminate\Http\Request;

class MessageDetailController extends Controller
{
    /**
     * Messsage Detail Controller constructor.
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
        $message_detail = MessageDetail::paginate(3);

        return view('message-details.index', ['message_details' => $message_detail]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $messages = Message::all('id', 'title');
        
        return view('message-details.create', ['messages' => $messages]);
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

        MessageDetail::create([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path,
            'message_id'    => $request->message_id,
            'created_by'    => auth()->id()
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\MessageDetail  $message_detail
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(MessageDetail $message_detail)
    {
        return view('message-details.show', ['message_detail' => $message_detail]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MessageDetail  $message_detail
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(MessageDetail $message_detail)
    {
        $messages = Message::all('id', 'title');

        return view('message-details.edit', [
            'message_detail'    => $message_detail,
            'messages'          => $messages,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MessageDetail  $message_detail
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MessageDetail $message_detail)
    {
        $thumbnail_path = null; 

        if ($request->hasFile('thumbnail'))
            $thumbnail_path = $this->getThumbnailPath($request->file('thumbnail')->store('public/message-detail-thumbnails'));

        $message_detail->update([
            'title'         => $request->title,
            'description'   => $request->description,
            'thumbnail'     => $thumbnail_path ? $thumbnail_path : $message_detail->thumbnail,
            'message_id'    => $request->message_id,
            'updated_by'    => auth()->id()
        ]);

        return redirect()->route('show-message-detail', $message_detail);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MessageDetail  $message_detail
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(MessageDetail $message_detail)
    {
        $message_detail->delete();

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

        $title = $extras['apiParameters']['whitelabel-message-details'];

        $item = MessageDetail::where('title', '=', $title)->first();

        $bot->typesAndWaits(1);
        $bot->reply($item->title);

        $bot->typesAndWaits(1);
        $bot->reply($item->description);
    }
}

<?php

namespace App\Http\Controllers;

use App\Member;
use App\District;
use App\ItemCategory;
use App\Conversation;
use BotMan\BotMan\BotMan;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $members = Member::paginate(10);

        return view('members.index', ['members' => $members]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(BotMan $bot)
    {            
        $user = $bot->getUser();
        $extras = $bot->getMessage()->getExtras();        
        $apiReply = $extras['apiReply'];

        $bot->typesAndWaits(1);

        if(! $this->check($user))
        {
            $incomplete = $extras['apiActionIncomplete'];  
            
            if($incomplete)
            {
                $bot->reply($apiReply); 
            }
            else
            {
                $bot->reply($apiReply);

                $bot->reply($this->features());

                $this->subscribe($user, $extras);
            }
        }
        else
        {
            $bot->reply($this->features());
        }
    }

    /**
     * Reply to a member who reject ot give data
     *
     * @param BotMan $bot
     *
     * @return void
     */
    public function reject(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();
        
        $apiReply = $extras['apiReply'];

        $bot->typesAndWaits(1);     
        
        $bot->reply($apiReply);
    }

    /**
     * Check if Member exists.
     *
     * @return \Illuminate\Http\Response
     */
    public function check($user)
    {
        $member = Member::where('user_platform_id', '=', $user->getId())->first();

        return $member ? true : false;        
    }

    /**
     * Listen for Get Started action for new Member.
     *
     * @param BotMan $bot
     *
     * @return void
     */
    public function started(BotMan $bot)
    {
        $user = $bot->getUser();
        $user_id = $user->getId();

        $bot->typesAndWaits(1);

        $extras = $bot->getMessage()->getExtras();
        $apiReply = $extras['apiReply'];
        $bot->reply($apiReply);
        $apiAction = $extras['apiAction'];
        $bot->reply($apiAction);
        $apiIntent = $extras['apiIntent'];
        $bot->reply($apiIntent);

        if($this->check($user)) 
        {
            $bot->reply('Welcome back ' .  $user->getFirstName());

            $bot->reply($this->features());


            $member = Member::where('user_platform_id', '=', $user_id)->first();

            $bot->reply($member->id);
//
//            if($member)
//            {
//                Conversation::record($member->id, 'Hello');
//            }
        } 
        else 
        {
            $extras = $bot->getMessage()->getExtras();

            $apiReply = $extras['apiReply'];

            $bot->reply($apiReply);
        }
    }

    /**
     * Subscribe new Member
     *
     * @param $user
     * @param $extras
     *
     * @return void
     */
    public function subscribe($user, $extras)
    {
        $profile_pic = $user->getInfo()["profile_pic"];
        $gender = $user->getInfo()["gender"];
        
        $age = $extras['apiParameters']['age']->amount;
        $district = $extras['apiParameters']['district'];

        $district = District::where('name', '=', $district)->first();

        Member::create([
            'user_platform_id'  => $user->getId(),
            'name'              => $user->getFirstName() . ' ' . $user->getLastName(),
            'avatar'            => $profile_pic,
            'born_year'         => $age,
            'gender'            => $gender,
            'platform_id'       => null,
            'district_id'       => $district->id,
        ]);
    }

    /**
     * Unsubscribe Member from receiving updates from the System0
     * .
     * @param BotMan $bot
     *
     * @return void
     */
    public function unsubscribe(BotMan $bot)
    {
        $user = $bot->getUser();

        $member = Member::where('user_platform_id', '=', $user->getId());

        if($member)
        {
            $extras = $bot->getMessage()->getExtras();

            $apiReply = $extras['apiReply'];
            $bot->typesAndWaits(1);
            $bot->reply($apiReply);
            
            $member->update([
                'status' => 0
            ]);
        }
    }

    /**
     * Display a list of bot features in a Generic Template.
     *
     * @return \BotMan\Drivers\Facebook\Extensions\GenericTemplate
     */
    public function features()
    {
        $categories = ItemCategory::inRandomOrder();
                            
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($categories as $category)
        {
            $url = $category->thumbnail
                ? (env('AWS_URL') . '/' . $category->thumbnail)
                : (env('APP_URL') . '/img/logo.jpg');

            $template_list->addElements([
                Element::create($category->name)
                    ->subtitle($category->description)
                    ->image($url)
                    ->addButton(ElementButton::create('View Details')
                        ->payload($category->name)->type('postback'))
            ]);
        } 

        return $template_list;
    }
}

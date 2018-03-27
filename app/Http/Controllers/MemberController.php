<?php

namespace App\Http\Controllers;

use App\Member;
use App\Platform;
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
     * @param BotMan $bot
     *
     * @return \Illuminate\Http\Response
     */
    public function store(BotMan $bot)
    {            
        $user = $bot->getUser();
        $driver = $bot->getDriver()->getName();
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
                if($driver === 'Slack'){
                    $bot->reply(print_r($user, true));
                }
                $this->subscribe($user, $extras, $driver);
                
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

        $bot->typesAndWaits(1);

        if($this->check($user)) 
        {
            $bot->reply('Karibu tena ' .  $user->getFirstName());

            $bot->reply($this->features());
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
     * @param $driver
     *
     * @return void
     */
    public function subscribe($user, $extras, $driver)
    {
        $age = $extras['apiParameters']['age']->amount;
        $district = $extras['apiParameters']['district'];
        $born_year = date('Y') - $age;
        $platform_id = $this->getPlatformId($driver);
        $profile_pic = $this->getUserProfilePic($user, $driver);
        $gender = $this->getUserGender($user, $driver);

        $district = District::where('name', '=', $district)->first();

        $member = Member::create([
            'user_platform_id'  => $user->getId(),
            'name'              => $user->getFirstName() . ' ' . $user->getLastName(),
            'avatar'            => $profile_pic,
            'born_year'         => $born_year,
            'gender'            => $gender,
            'platform_id'       => $platform_id,
            'district_id'       => $district->id,
        ]);

        if ($member)
        {
            Conversation::create([
                'intent'    => 'Subscribe',
                'member_id' => $member->id
            ]);
        }
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

            Conversation::create([
                'intent'    => 'Unsubscribe',
                'member_id' => $member->id
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
        $categories = ItemCategory::inRandomOrder()->take(5)->get();
                            
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($categories as $category)
        {
            $url = null;

            if ($category->thumbnail)
                $url = env('AWS_URL') . '/' . $category->thumbnail;
            else
                $url = env('APP_URL') . '/img/logo.jpg';

            $template_list->addElements([
                Element::create($category->name)
                    ->subtitle($category->description)
                    ->image($url)
                    ->addButton(ElementButton::create('Fahamu zaidi')
                        ->payload($category->name)->type('postback'))
            ]);
        } 

        return $template_list;
    }

    /**
     * Get platform id of user based on driver
     *
     * @param $driver
     *
     * @return int or null
     */
    public function getPlatformId($driver)
    {
        $platform = Platform::where('name', '=', $driver)->first();
        if(!$platform){
            $platform_id = null;
        }else{
            $platform_id = $platform->id;
        }
        
        return $platform_id;
    }

    /**
     * return user profile pic based on driver
     * 
     * @param $user
     * @param $driver
     * 
     * @return profile_pc
     * 
     */
    public function getUserProfilePic($user, $driver)
    {
        if($driver === 'Facebook')
        {
            return $profile_pic = $user->getInfo()["profile_pic"];
        }
        elseif($driver === 'Slack')
        {
            return $profile_pic = $user->getInfo()["profile"]["image_original"];
        }
        return;
    }

    /**
     * return user gender based on driver
     * 
     * @param $user
     * @param $driver
     * 
     * @return gender
     * 
     */
    public function getUserGender($user, $driver)
    {
        if($driver === 'Facebook')
        {
            $gender = $user->getInfo()["gender"];
            return $gender;
        }
        elseif($driver === 'Slack')
        {
           $gender = "male";
           return $gender;
        }
        return;
    }
}

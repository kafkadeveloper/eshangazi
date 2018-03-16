<?php

namespace App\Http\Controllers;

use App\Member;
use App\Partner;
use App\District;
use App\PartnerCategory;
use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use BotMan\Drivers\Facebook\Extensions\Element;
use BotMan\Drivers\Facebook\Extensions\ElementButton;
use BotMan\Drivers\Facebook\Extensions\GenericTemplate;

class PartnerController extends Controller
{
    /**
     * Partner Category Controller constructor.
     *
     */
    public function __construct(){
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $partners = Partner::paginate(10);
        
        return view('partners.index', ['partners' => $partners]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $partner_categories = PartnerCategory::all('id', 'name');

        $districts          = District::all();
        return view('partners.create', [
            'partner_categories' => $partner_categories,
            'districts'          => $districts
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
        Partner::create([
            'name'                  => $request->name,
            'bio'                   => $request->bio,
            'partner_category_id'   => $request->partner_category_id,
            'phone'                 => $request->phone,
            'email'                 => $request->email,
            'address'               => $request->address,
            'district_id'           => $request->district_id,
            'created_by'            => auth()->id()
        ]);
        
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  Partner $partner
     * 
     * @return \Illuminate\Http\Response
     */
    public function show(Partner $partner)
    {
        return view('partners.show', ['partner' => $partner]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Partner $partner
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(Partner $partner)
    {
        $partner_categories = PartnerCategory::all('id', 'name');
        $districts = District::all('id', 'name');

        return view('partners.edit', [
                'partner'               => $partner,
                'partner_categories'    => $partner_categories,
                'districts'             => $districts
            ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request     *
     * @param  Partner $partner
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Partner $partner)
    {

        $partner->update([
            'name'                  => $request->name,
            'bio'                   => $request->bio,
            'partner_category_id'   => $request->partner_category_id,
            'phone'                 => $request->phone,
            'email'                 => $request->email,
            'address'               => $request->address,
            'district_id'           => $request->district_id,
            'updated_by'            => auth()->id()
        ]);

        return redirect()->route('show-partner', $partner);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Partner $partner
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(Partner $partner)
    {
        $partner->delete();

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

        $bot->typesAndWaits(1);
        $bot->reply($apiReply);  

        $user = $bot->getUser();

        $member = Member::with('district')
            ->where('user_platform_id', '=', $user->getId())->first();

        $partners = Partner::where('district_id', $member->district_id)
            ->where('partner_category_id', 2)->take(5)->get();
            
        $bot->typesAndWaits(1);

        $this->getNearExperts($bot, $partners, $user, $member);
    }

    /**
     * Get a list of Experts based on District as Location for a Member..
     *
     * @param  BotMan $bot
     * 
     * @return void
     */
    public function showByDistrictBotMan(BotMan $bot)
    {
        $extras = $bot->getMessage()->getExtras();        
        $apiReply = $extras['apiReply'];

        $district = $extras['apiParameters'][env('APP_ACTION') . '-districts'];

        $bot->typesAndWaits(1);
        $bot->reply($apiReply);

        if($district)
        {
            $district = District::with('centers')->where('name', '=', $district)->first();

            $partners = Partner::where('district_id', '=', $district->id)->inRandomOrder()->take(5)->get();

            $bot->typesAndWaits(2);
            $bot->reply($this->partners($partners));
        } 
        else
        {           
            $user = $bot->getUser();

            $bot->reply('Hey ' . $user->getFirstName() .
                ', I could not find Experts at ' . $district .
                ', I have these suggestions.');

            $partners = Partner::where('district_id', '=', $district->id)->inRandomOrder()->take(5)->get();         
            
            $bot->typesAndWaits(1);
            $bot->reply($this->partners($partners));                      
        }        
    }

    /**
     * Display a list of Experts near a particular Member in Generic Template.
     *
     * @param $partners
     *
     * @return \BotMan\Drivers\Facebook\Extensions\GenericTemplate
     */
    public function partners($partners)
    {                           
        $template_list = GenericTemplate::create()->addImageAspectRatio(GenericTemplate::RATIO_HORIZONTAL);
             
        foreach($partners as $partner)
        {
            $url = $partner->thumbnail
                ? (env('AWS_URL') . '/' . $partner->thumbnail)
                : (env('APP_URL') . '/img/logo.jpg');

            $template_list->addElements([
                Element::create($partner->name)
                    ->subtitle($partner->bio)
                    ->image($url)
                    ->addButton(ElementButton::create('Call Now')
                        ->payload($partner->phone)->type('phone_number'))
            ]);
        }

        return $template_list;
    }

    /**
     * Display a list of Experts found near particular Member.
     *
     * @param BotMan $bot
     * @param $partners
     * @param $user
     * @param $member
     *
     * @return void
     */
    public function getNearExperts(BotMan $bot, $partners, $user, $member)
    {
        if (!$partners->isEmpty()) {
            $bot->reply($this->partners($partners));
        } else {
            $bot->reply('Hey ' . $user->getFirstName() .
                ', I could not find Experts at ' . $member->district->name .
                ', I have these suggestions.');

            $partners = Partner::inRandomOrder()->take(5)->get();;

            $bot->typesAndWaits(1);
            $bot->reply($this->partners($partners));
        }
    }
}

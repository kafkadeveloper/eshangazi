<?php


$features = env('FEATURES');
$features = explode(",",$features);
$features = str_replace("'","",$features);

return [

    /*
    |--------------------------------------------------------------------------
    | Facebook Token
    |--------------------------------------------------------------------------
    |
    | Your Facebook application you received after creating
    | the messenger page / application on Facebook.
    |
    */
    'token' => env('FACEBOOK_TOKEN'),

    /*
    |--------------------------------------------------------------------------
    | Facebook App Secret
    |--------------------------------------------------------------------------
    |
    | Your Facebook application secret, which is used to verify
    | incoming requests from Facebook.
    |
    */
    'app_secret' => env('FACEBOOK_APP_SECRET'),

    /*
    |--------------------------------------------------------------------------
    | Facebook Verification
    |--------------------------------------------------------------------------
    |
    | Your Facebook verification token, used to validate the webhooks.
    |
    */
    'verification' => env('FACEBOOK_VERIFICATION'),

    /*
    |--------------------------------------------------------------------------
    | Facebook Start Button Payload
    |--------------------------------------------------------------------------
    |
    | The payload which is sent when the Get Started Button is clicked.
    |
    */
    'start_button_payload' => 'GET_STARTED',

    /*
    |--------------------------------------------------------------------------
    | Facebook Greeting Text
    |--------------------------------------------------------------------------
    |
    | Your Facebook Greeting Text which will be shown on your message start screen.
    |
    */
    'greeting_text' => [
        'greeting' => [
            [
                'locale' => 'default',
                'text' => 'Hello!',
            ],
            [
                'locale' => 'en_US',
                'text' => 'Timeless apparel for the masses.',
            ],
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Facebook Persistent Menu
    |--------------------------------------------------------------------------
    |
    | Items for your persistent Facebook menu.
    |
    */

    'persistent_menu' => [
        [
            'locale' => 'default',
            'call_to_actions' => [
                [
                    'title' => 'Kuhusu',
                    'type'  => 'nested',
                    'call_to_actions' => [
                        [
                            'title'     => str_replace("[","",$features[0]),
                            'type'      => 'postback',
                            'payload'   => 'FEATURE_ONE_PAYLOAD',
                        ],
                        [
                            'title'     => $features[1],
                            'type'      => 'postback',
                            'payload'   => 'FEATURE_TWO_PAYLOAD',
                        ],
                        [
                            'title'     => str_replace("]","",$features[0]),
                            'type'      => 'postback',
                            'payload'   => 'FEATURE_THREE_PAYLOAD',
                        ],
                    ],
                ],
                [
                    'title'     => 'Wataalam na Msaada',
                    'type'  => 'nested',
                    'call_to_actions' => [
                        [
                            'title'     => 'Wataalam',
                            'type'      => 'postback',
                            'payload'   => 'REFERRALS_PAYLOAD',
                        ],
                        [
                            'title'     => 'Vituo vya Huduma',
                            'type'      => 'postback',
                            'payload'   => 'CENTERS_PAYLOAD',
                        ],
                    ],
                ],
                [
                    'title'     => 'Michezo na Maoni',
                    'type'  => 'nested',
                    'call_to_actions' => [
                        [
                            'title'     => 'Mchezo wa Maswali',
                            'type'      => 'postback',
                            'payload'   => 'QUESTION_ANSWERS_PAYLOAD',
                        ],
                        [
                            'title'     => 'Maoni Yako',
                            'type'      => 'postback',
                            'payload'   => 'FEEDBACK_PAYLOAD',
                        ],
                    ],
                ],
            ],
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Facebook Domain Whitelist
    |--------------------------------------------------------------------------
    |
    | In order to use domains you need to whitelist them
    |
    */
    'whitelisted_domains' => [
        'https://petersfancyapparel.com',
    ],
];

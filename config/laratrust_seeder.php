<?php

return [
    'role_structure' => [
        'superadministrator' => [
            'users' => 'c,r,u,d',
            'profile' => 'c,r,u,d',
            'feature' => 'c,r,u,d',
            'settings' => 'c,r,u,d'
        ],
        'administrator' => [
            'users' => 'c,r,u,d',
        ],
        'accountant' => [
            'quiz' => 'c,r,u,d'
        ],
        'communication' => [
            'location' => 'c,r,u,d',
            'conversation' => 'c,r,u,d',
            'partner' => 'c,r,u,d',
            'ads' => 'c,r,u,d'
        ],
    ],
    'permission_structure' => [
        'cru_user' => [
            'profile' => 'c,r,u'
        ],
    ],
    'permissions_map' => [
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete'
    ]
];

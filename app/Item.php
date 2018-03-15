<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 
        'description',
        'thumbnail',
        'gender',
        'minimum_age',
        'item_category_id',
        'created_by',
        'updated_by'
    ];

    /**
     * An Item belongs to an Item Category.
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo(ItemCategory::class, 'item_category_id');
    }      

    /**
     * An Item created by a user.
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }  

    /**
     * An Item updated by a user.
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function updator()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}

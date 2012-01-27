{* Purpose of this template: Display movies in text mailings *}
{foreach item='item' from=$items}
        {$item.title}
        {modurl modname='MUFlash' type='user' func='display' ot=$objectType id=$item.id fqurl=true}
-----
{foreachelse}
    {gt text='No movies found.'}
{/foreach}

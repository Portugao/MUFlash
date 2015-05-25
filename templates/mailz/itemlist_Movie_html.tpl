{* Purpose of this template: Display movies in html mailings *}
{*
<ul>
{foreach item='item' from=$items}
    <li>
        <a href="{modurl modname='MUFlash' type='user' func='display' ot=$objectType id=$item.id fqurl=true}
">{$item.title}
</a>
    </li>
{foreachelse}
    <li>{gt text='No movies found.'}</li>
{/foreach}
</ul>
*}

{include file='contenttype/itemlist_Movie_display_description.tpl'}

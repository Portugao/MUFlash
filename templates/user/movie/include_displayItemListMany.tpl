{* purpose of this template: inclusion template for display of related Movies in user area *}

{if isset($items) && $items ne null}
<ul class="relatedItemList Movie">
{foreach name='relLoop' item='item' from=$items}
    <li>
    <a href="{modurl modname='MUFlash' type='user' func='display' ot='movie' id=$item.id}">
        {$item.title}
    </a>
    <a id="movieItem{$item.id}Display" href="{modurl modname='MUFlash' type='user' func='display' ot='movie' id=$item.id theme='Printer' forcelongurl=true}" title="{gt text='Open quick view window'}" style="display: none">
        {icon type='view' size='extrasmall' __alt='Quick view'}
    </a>
    <script type="text/javascript" charset="utf-8">
    /* <![CDATA[ */
        document.observe('dom:loaded', function() {
            muflashInitInlineWindow($('movieItem{{$item.id}}Display'), '{{$item.title|replace:"'":""}}');
        });
    /* ]]> */
    </script>
    <br />
{if $item.preview ne '' && isset($item.previewFullPathURL)}
    <img src="{$item.preview|muflashImageThumb:$item.previewFullPathURL:50:40}" width="50" height="40" alt="{$item.title|replace:"\"":""}" />
{/if}

    </li>
{/foreach}
</ul>
{/if}


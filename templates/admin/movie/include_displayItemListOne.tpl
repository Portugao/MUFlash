{* purpose of this template: inclusion template for display of related Movies in admin area *}

<h4>
    <a href="{modurl modname='MUFlash' type='admin' func='display' ot='movie' id=$item.id}">
        {$item.title}
    </a>
    <a id="movieItem{$item.id}Display" href="{modurl modname='MUFlash' type='admin' func='display' ot='movie' id=$item.id theme='Printer'}" title="{gt text='Open quick view window'}" style="display: none">
        {icon type='view' size='extrasmall' __alt='Quick view'}
    </a>
</h4>
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


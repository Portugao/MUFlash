{* purpose of this template: movies view view in user area *}
<div class="muflash-movie muflash-view">
{include file='user/header.tpl'}
{gt text='Movie list' assign='templateTitle'}
{pagesetvar name='title' value=$templateTitle}
<div class="z-frontendcontainer">
    <h2>{$templateTitle}</h2>



    {assign var='all' value=0}
    {if isset($showAllEntries) && $showAllEntries eq 1}
        {gt text='Back to paginated view' assign='linkTitle'}
        <a href="{modurl modname='MUFlash' type='user' func='view' ot='movie'}" title="{$linkTitle}" class="z-icon-es-view">
            {$linkTitle}
        </a>
        {assign var='all' value=1}
    {else}
        {gt text='Show all entries' assign='linkTitle'}
        <a href="{modurl modname='MUFlash' type='user' func='view' ot='movie' all=1}" title="{$linkTitle}" class="z-icon-es-view">
            {$linkTitle}
        </a>
    {/if}

<table class="z-datatable">
    <colgroup>
        <col id="ctitle" />
        <col id="cdescription" />
        <col id="cpreview" />
       {* <col id="cflashfile" /> *}
        <col id="citemactions" />
    </colgroup>
    <thead>
    <tr>
        <th id="htitle" scope="col" class="z-left">
            {sortlink __linktext='Title' sort='title' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='user' func='view' ot='movie'}
        </th>
        <th id="hdescription" scope="col" class="z-left">
            {sortlink __linktext='Description' sort='description' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='user' func='view' ot='movie'}
        </th>
        <th id="hpreview" scope="col" class="z-left">
            {sortlink __linktext='Preview' sort='preview' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='user' func='view' ot='movie'}
        </th>
        {* <th id="hflashfile" scope="col" class="z-left">
            {sortlink __linktext='Flash file' sort='flashFile' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='user' func='view' ot='movie'}
        </th> *}
        <th id="hitemactions" scope="col" class="z-right z-order-unsorted">{gt text='Actions'}</th>
    </tr>
    </thead>
    <tbody>

    {foreach item='movie' from=$items}
    <tr class="{cycle values='z-odd, z-even'}">
        <td headers="htitle" class="z-left">
            {$movie.title|notifyfilters:'muflash.filterhook.movies'}
        </td>
        <td headers="hdescription" class="z-left">
            {$movie.description}
        </td>
        <td headers="hpreview" class="z-left">
            {if $movie.preview ne ''}
              <a href="{$movie.previewFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.previewMeta.isImage} rel="imageviewer[movie]"{/if}>
              {if $movie.previewMeta.isImage}
                  <img src="{$movie.preview|muflashImageThumb:$movie.previewFullPath:32:20}" width="32" height="20" alt="{$movie.title|replace:"\"":""}" />
              {else}
                  {gt text='Download'} ({$movie.previewMeta.size|muflashGetFileSize:$movie.previewFullPath:false:false})
              {/if}
              </a>
            {else}&nbsp;{/if}

        </td>
        {* <td headers="hflashfile" class="z-left">
            {if $movie.flashFile ne ''}
              <a href="{$movie.flashFileFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.flashFileMeta.isImage} rel="imageviewer[movie]"{/if}>
              {if $movie.flashFileMeta.isImage}
                  <img src="{$movie.flashFile|muflashImageThumb:$movie.flashFileFullPath:32:20}" width="32" height="20" alt="{$movie.title|replace:"\"":""}" />
              {else}
                  {gt text='Download'} ({$movie.flashFileMeta.size|muflashGetFileSize:$movie.flashFileFullPath:false:false})
              {/if}
              </a>
            {else}&nbsp;{/if}

        </td> *}
        <td headers="hitemactions" class="z-right z-nowrap z-w02">
            {if count($movie._actions) gt 0}
            {strip}
                {foreach item='option' from=$movie._actions}
                    <a href="{$option.url.type|muflashActionUrl:$option.url.func:$option.url.arguments}" title="{$option.linkTitle|safetext}"{if $option.icon eq 'preview'} target="_blank"{/if}>
                        {icon type=$option.icon size='extrasmall' alt=$option.linkText|safetext}
                    </a>
                {/foreach}
            {/strip}
            {/if}
        </td>
    </tr>
    {foreachelse}
        <tr class="z-datatableempty">
          <td class="z-left" colspan="11">
            {gt text='No movies found.'}
          </td>
        </tr>
    {/foreach}

    </tbody>
</table>

    {if !isset($showAllEntries) || $showAllEntries ne 1}
        {pager rowcount=$pager.numitems limit=$pager.itemsperpage display='page'}
    {/if}

    {notifydisplayhooks eventname='muflash.ui_hooks.movies.display_view' urlobject=$currentUrlObject assign='hooks'}
    {foreach key='hookname' item='hook' from=$hooks}
        {$hook}
    {/foreach}
</div>
</div>
{include file='user/footer.tpl'}


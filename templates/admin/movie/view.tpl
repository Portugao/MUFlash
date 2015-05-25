{* purpose of this template: movies view view in admin area *}
<div class="muflash-movie muflash-view">
{include file='admin/header.tpl'}
{gt text='Movie list' assign='templateTitle'}
{pagesetvar name='title' value=$templateTitle}
<div class="z-admin-content-pagetitle">
    {icon type='view' size='small' alt=$templateTitle}
    <h3>{$templateTitle}</h3>
</div>


    {checkpermissionblock component='MUFlash::' instance='.*' level="ACCESS_ADD"}
        {gt text='Create movie' assign='createTitle'}
        <a href="{modurl modname='MUFlash' type='admin' func='edit' ot='movie'}" title="{$createTitle}" class="z-icon-es-add">
            {$createTitle}
        </a>
    {/checkpermissionblock}

    {assign var='all' value=0}
    {if isset($showAllEntries) && $showAllEntries eq 1}
        {gt text='Back to paginated view' assign='linkTitle'}
        <a href="{modurl modname='MUFlash' type='admin' func='view' ot='movie'}" title="{$linkTitle}" class="z-icon-es-view">
            {$linkTitle}
        </a>
        {assign var='all' value=1}
    {else}
        {gt text='Show all entries' assign='linkTitle'}
        <a href="{modurl modname='MUFlash' type='admin' func='view' ot='movie' all=1}" title="{$linkTitle}" class="z-icon-es-view">
            {$linkTitle}
        </a>
    {/if}

<table class="z-datatable">
    <colgroup>
        <col id="ctitle" />
        <col id="cdescription" />
        <col id="cpreview" />
        <col id="cflashfile" />
        <col id="cbackgroundcolour" />
        <col id="cplay" />
        <col id="cplayloop" />
        <col id="cwidth" />
        <col id="cheight" />
        <col id="cplayerversion" />
        <col id="citemactions" />
    </colgroup>
    <thead>
    <tr>
        <th id="htitle" scope="col" class="z-left">
            {sortlink __linktext='Title' sort='title' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hdescription" scope="col" class="z-left">
            {sortlink __linktext='Description' sort='description' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hpreview" scope="col" class="z-left">
            {sortlink __linktext='Preview' sort='preview' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hflashfile" scope="col" class="z-left">
            {sortlink __linktext='Flash file' sort='flashFile' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hbackgroundcolour" scope="col" class="z-left">
            {sortlink __linktext='Background colour' sort='backgroundColour' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hplay" scope="col" class="z-center">
            {sortlink __linktext='Play' sort='play' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hplayloop" scope="col" class="z-center">
            {sortlink __linktext='Play loop' sort='playLoop' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hwidth" scope="col" class="z-left">
            {sortlink __linktext='Width' sort='width' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hheight" scope="col" class="z-left">
            {sortlink __linktext='Height' sort='height' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
        <th id="hplayerversion" scope="col" class="z-left">
            {sortlink __linktext='Player version' sort='playerVersion' currentsort=$sort sortdir=$sdir all=$all modname='MUFlash' type='admin' func='view' ot='movie'}
        </th>
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
        <td headers="hflashfile" class="z-left">
            {if $movie.flashFile ne ''}
              <a href="{$movie.flashFileFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.flashFileMeta.isImage} rel="imageviewer[movie]"{/if}>
              {if $movie.flashFileMeta.isImage}
                  <img src="{$movie.flashFile|muflashImageThumb:$movie.flashFileFullPath:32:20}" width="32" height="20" alt="{$movie.title|replace:"\"":""}" />
              {else}
                  {gt text='Download'} ({$movie.flashFileMeta.size|muflashGetFileSize:$movie.flashFileFullPath:false:false})
              {/if}
              </a>
            {else}&nbsp;{/if}

        </td>
        <td headers="hbackgroundcolour" class="z-left">
            {$movie.backgroundColour}
        </td>
        <td headers="hplay" class="z-center">
            {$movie.play|yesno:true}
        </td>
        <td headers="hplayloop" class="z-center">
            {$movie.playLoop|yesno:true}
        </td>
        <td headers="hwidth" class="z-left">
            {$movie.width}
        </td>
        <td headers="hheight" class="z-left">
            {$movie.height}
        </td>
        <td headers="hplayerversion" class="z-left">
            {$movie.playerVersion}
        </td>
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
        <tr class="z-admintableempty">
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
</div>
{include file='admin/footer.tpl'}


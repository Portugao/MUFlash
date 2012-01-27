{* purpose of this template: movies display view in admin area *}
{include file='admin/header.tpl'}
<div class="muflash-movie muflash-display">
{gt text='Movie' assign='templateTitle'}
{assign var='templateTitle' value=$movie.title|default:$templateTitle}
{pagesetvar name='title' value=$templateTitle|@html_entity_decode}
<div class="z-admin-content-pagetitle">
    {icon type='display' size='small' __alt='Details'}
    <h3>{$templateTitle|notifyfilters:'muflash.filter_hooks.movies.filter'}</h3>
</div>


<dl id="MUFlash_body">
    <dt>{gt text='Description'}</dt>
    <dd>{$movie.description}</dd>
    <dt>{gt text='Preview'}</dt>
    <dd>{if $movie.preview ne ''}
  <a href="{$movie.previewFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.previewMeta.isImage} rel="imageviewer[movie]"{/if}>
  {if $movie.previewMeta.isImage}
      <img src="{$movie.preview|muflashImageThumb:$movie.previewFullPath:250:150}" width="250" height="150" alt="{$movie.title|replace:"\"":""}" />
  {else}
      {gt text='Download'} ({$movie.previewMeta.size|muflashGetFileSize:$movie.previewFullPath:false:false})
  {/if}
  </a>
{else}&nbsp;{/if}
</dd>
    <dt>{gt text='Flash file'}</dt>
    <dd>{if $movie.flashFile ne ''}
  <a href="{$movie.flashFileFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.flashFileMeta.isImage} rel="imageviewer[movie]"{/if}>
  {if $movie.flashFileMeta.isImage}
      <img src="{$movie.flashFile|muflashImageThumb:$movie.flashFileFullPath:250:150}" width="250" height="150" alt="{$movie.title|replace:"\"":""}" />
  {else}
      {gt text='Download'} ({$movie.flashFileMeta.size|muflashGetFileSize:$movie.flashFileFullPath:false:false})
  {/if}
  </a>
{else}&nbsp;{/if}
</dd>
    <dt>{gt text='Background colour'}</dt>
    <dd>{$movie.backgroundColour}</dd>
    <dt>{gt text='Play'}</dt>
    <dd>{$movie.play|yesno:true}</dd>
    <dt>{gt text='Play loop'}</dt>
    <dd>{$movie.playLoop|yesno:true}</dd>
    <dt>{gt text='Width'}</dt>
    <dd>{$movie.width}</dd>
    <dt>{gt text='Height'}</dt>
    <dd>{$movie.height}</dd>
    <dt>{gt text='Player version'}</dt>
    <dd>{$movie.playerVersion}</dd>
</dl>
    {include file='admin/include_standardfields_display.tpl' obj=$movie}

{if !isset($smarty.get.theme) || $smarty.get.theme ne 'Printer'}
{if count($movie._actions) gt 0}
    <p>{strip}
    {foreach item='option' from=$movie._actions}
        <a href="{$option.url.type|muflashActionUrl:$option.url.func:$option.url.arguments}" title="{$option.linkTitle|safetext}" class="z-icon-es-{$option.icon}">
            {$option.linkText|safetext}
        </a>
    {/foreach}
    {/strip}</p>
{/if}

{* include display hooks *}
{notifydisplayhooks eventname='muflash.ui_hooks.movies.display_view' id=$movie.id urlobject=$currentUrlObject assign='hooks'}
{foreach key='hookname' item='hook' from=$hooks}
    {$hook}
{/foreach}

{/if}

</div>
{include file='admin/footer.tpl'}


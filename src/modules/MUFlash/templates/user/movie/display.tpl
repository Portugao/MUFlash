{* purpose of this template: movies display view in user area *}
{include file='user/header.tpl'}
<div class="muflash-movie muflash-display">
{gt text='Movie' assign='templateTitle'}
{assign var='templateTitle' value=$movie.title|default:$templateTitle}
{pagesetvar name='title' value=$templateTitle|@html_entity_decode}
<div class="z-frontendcontainer">
    <h2>{$templateTitle|notifyfilters:'muflash.filter_hooks.movies.filter'}</h2>
    <p>{$movie.description}</p>
		<div id="{$movie.title}">
			<a href="http://www.adobe.com/go/getflash">
				<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
			</a>
			<p>{gt text='For this website is flash player version'} {$movie.playerVersion} {gt text='or higher necessary.'}</p>
		</div>

{* <dl id="MUFlash_body">
    <dt>{gt text='Description'}</dt>
    <dd>{$movie.description}</dd>
    <dt>{gt text='Flash file'}</dt>
    <dd>  <a href="{$movie.flashFileFullPathURL}" title="{$movie.title|replace:"\"":""}"{if $movie.flashFileMeta.isImage} rel="imageviewer[movie]"{/if}>
  {if $movie.flashFileMeta.isImage}
      <img src="{$movie.flashFile|muflashImageThumb:$movie.flashFileFullPath:250:150}" width="250" height="150" alt="{$movie.title|replace:"\"":""}" />
  {else}
      {gt text='Download'} ({$movie.flashFileMeta.size|muflashGetFileSize:$movie.flashFileFullPath:false:false})
  {/if}
  </a>
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
    {include file='user/include_standardfields_display.tpl' obj=$movie} *}

{if !isset($smarty.get.theme) || $smarty.get.theme ne 'Printer'}
{* {if count($movie._actions) gt 0}
    <p>{strip}
    {foreach item='option' from=$movie._actions}
        <a href="{$option.url.type|muflashActionUrl:$option.url.func:$option.url.arguments}" title="{$option.linkTitle|safetext}" class="z-icon-es-{$option.icon}">
            {$option.linkText|safetext}
        </a>
    {/foreach}
    {/strip}</p>
{/if} *}

{* include display hooks *}
{notifydisplayhooks eventname='muflash.ui_hooks.movies.display_view' id=$movie.id urlobject=$currentUrlObject assign='hooks'}
{foreach key='hookname' item='hook' from=$hooks}
    {$hook}
{/foreach}

{/if}

</div>
</div>
{include file='user/footer.tpl'}


{* Purpose of this template: Display movies within an external context *}

{foreach item='item' from=$items}
    <h3>{$item.title}</h3>
    	<div id="{$item.title}">
			<a href="http://www.adobe.com/go/getflash">
				<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
			</a>
			<p>{gt text='For this website is flash player version'} {$item.playerVersion} {gt text='or higher necessary.'}</p>
		</div>
{/foreach}

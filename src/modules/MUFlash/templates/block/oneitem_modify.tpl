{* Purpose of this template: Edit block for generic item list *}

<div class="z-formrow">
    <label for="MUFlash_objecttype">{gt text='Object type'}:</label>
    <select id="MUFlash_objecttype" name="objecttype" size="1">
        <option value="movie"{if $objectType eq 'movie'} selected="selected"{/if}>{gt text='Movies'}</option>
    </select>
</div>

<div class="z-formrow">
    <label for="MUFlash_id">{gt text='Id'}:</label>
    <input type="text" id="MUFlash_id" name="id" size="10" value="{$id}" />
</div>

<div class="z-formrow">
    <label for="MUFlash_showtitle">{gt text='Display default block title?'}:</label>
    <input type="checkbox" id="MUFlash_showtitle" name="showtitle" value="1"{if $showtitle eq 1} checked="checked"{/if} />
</div>

<div class="z-formrow">
    <label for="MUFlash_template">{gt text='Template File'}:</label>
    <select id="MUFlash_template" name="template">
        <option value="oneitem_displaycontent.tpl"{if $template eq 'oneitem_displaycontent.tpl'} selected="selected"{/if}>{gt text='Only the flashfile'}</option>
        <option value="oneitem_display.tpl"{if $template eq 'oneitem_display.tpl'} selected="selected"{/if}>{gt text='Only item titles'}</option>
        <option value="oneitem_display_description.tpl"{if $template eq 'oneitem_display_description.tpl'} selected="selected"{/if}>{gt text='With description'}</option>
    </select>
</div>



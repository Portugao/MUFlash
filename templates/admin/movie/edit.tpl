{* purpose of this template: build the Form to edit an instance of movie *}
{include file='admin/header.tpl'}
{pageaddvar name='javascript' value='modules/MUFlash/javascript/MUFlash_editFunctions.js'}
{pageaddvar name='javascript' value='modules/MUFlash/javascript/MUFlash_validation.js'}

{if $mode eq 'edit'}
    {gt text='Edit movie' assign='templateTitle'}
    {assign var='adminPageIcon' value='edit'}
{elseif $mode eq 'create'}
    {gt text='Create movie' assign='templateTitle'}
    {assign var='adminPageIcon' value='new'}
{else}
    {gt text='Edit movie' assign='templateTitle'}
    {assign var='adminPageIcon' value='edit'}
{/if}
<div class="muflash-movie muflash-edit">
{pagesetvar name='title' value=$templateTitle}
<div class="z-admin-content-pagetitle">
    {icon type=$adminPageIcon size='small' alt=$templateTitle}
    <h3>{$templateTitle}</h3>
</div>
{form enctype='multipart/form-data' cssClass='z-form'}
    {* add validation summary and a <div> element for styling the form *}
    {muflashFormFrame}
    {formsetinitialfocus inputId='title'}

    <fieldset>
        <legend>{gt text='Content'}</legend>
        <div class="z-formrow">
            {formlabel for='title' __text='Title' mandatorysym='1'}
            {formtextinput group='movie' id='title' mandatory=true readOnly=false __title='Enter the title of the movie' textMode='singleline' maxLength=255 cssClass='required validate-unique'}
            {muflashValidationError id='title' class='required'}
            {muflashValidationError id='title' class='validate-unique'}
        </div>
        <div class="z-formrow">
            {formlabel for='description' __text='Description'}
            {formtextinput group='movie' id='description' mandatory=false __title='Enter the description of the movie' textMode='multiline' rows='6' cols='50' cssClass=''}
        </div>
        <div class="z-formrow">
            {formlabel for='preview' __text='Preview'}<br />{* break required for Google Chrome *}
            {formuploadinput group='movie' id='preview' mandatory=false readOnly=false cssClass=''}

            <div class="z-formnote">{gt text='Allowed file extensions:'} gif, jpeg, jpg, png</div>
            {if $mode ne 'create'}
                {if $movie.preview ne ''}
                  <div class="z-formnote">
                      {gt text='Current file'}:
                      <a href="{$movie.previewFullPathUrl}" title="{$movie.title|replace:"\"":""}"{if $movie.previewMeta.isImage} rel="imageviewer[movie]"{/if}>
                      {if $movie.previewMeta.isImage}
                          <img src="{$movie.preview|muflashImageThumb:$movie.previewFullPath:80:50}" width="80" height="50" alt="{$movie.title|replace:"\"":""}" />
                      {else}
                          {gt text='Download'} ({$movie.previewMeta.size|muflashGetFileSize:$movie.previewFullPath:false:false})
                      {/if}
                      </a>
                  </div>
                  <div class="z-formnote">
                      {formcheckbox group='movie' id='previewDeleteFile' readOnly=false __title='Delete preview ?'}
                      {formlabel for='previewDeleteFile' __text='Delete existing file'}
                  </div>
                {/if}
            {/if}
        </div>
        <div class="z-formrow">
            {formlabel for='flashFile' __text='Flash file'}<br />{* break required for Google Chrome *}
            {formuploadinput group='movie' id='flashFile' mandatory=false readOnly=false cssClass='validate-unique'}

            <div class="z-formnote">{gt text='Allowed file extensions:'} swf</div>
            {if $mode ne 'create'}
                {if $movie.flashFile ne ''}
                  <div class="z-formnote">
                      {gt text='Current file'}:
                      <a href="{$movie.flashFileFullPathUrl}" title="{$movie.title|replace:"\"":""}"{if $movie.flashFileMeta.isImage} rel="imageviewer[movie]"{/if}>
                      {if $movie.flashFileMeta.isImage}
                          <img src="{$movie.flashFile|muflashImageThumb:$movie.flashFileFullPath:80:50}" width="80" height="50" alt="{$movie.title|replace:"\"":""}" />
                      {else}
                          {gt text='Download'} ({$movie.flashFileMeta.size|muflashGetFileSize:$movie.flashFileFullPath:false:false})
                      {/if}
                      </a>
                  </div>
                  <div class="z-formnote">
                      {formcheckbox group='movie' id='flashFileDeleteFile' readOnly=false __title='Delete flash file ?'}
                      {formlabel for='flashFileDeleteFile' __text='Delete existing file'}
                  </div>
                {/if}
            {/if}
            {muflashValidationError id='flashFile' class='validate-unique'}
        </div>
        <div class="z-formrow">
            {formlabel for='backgroundColour' __text='Background colour' mandatorysym='1'}
            {formtextinput group='movie' id='backgroundColour' mandatory=true readOnly=false __title='Enter the background colour of the movie' textMode='singleline' maxLength=255 cssClass='required'}
            {muflashValidationError id='backgroundColour' class='required'}
        </div>
        <div class="z-formrow">
            {formlabel for='play' __text='Play'}
            {formcheckbox group='movie' id='play' readOnly=false __title='play ?' cssClass=''}
        </div>
        <div class="z-formrow">
            {formlabel for='playLoop' __text='Play loop'}
            {formcheckbox group='movie' id='playLoop' readOnly=false __title='play loop ?' cssClass=''}
        </div>
        <div class="z-formrow">
            {formlabel for='width' __text='Width' mandatorysym='1'}
            {formtextinput group='movie' id='width' mandatory=true readOnly=false __title='Enter the width of the movie' textMode='singleline' maxLength=255 cssClass='required'}
            {muflashValidationError id='width' class='required'}
        </div>
        <div class="z-formrow">
            {formlabel for='height' __text='Height' mandatorysym='1'}
            {formtextinput group='movie' id='height' mandatory=true readOnly=false __title='Enter the height of the movie' textMode='singleline' maxLength=255 cssClass='required'}
            {muflashValidationError id='height' class='required'}
        </div>
        <div class="z-formrow">
            {formlabel for='playerVersion' __text='Player version'}
            {formtextinput group='movie' id='playerVersion' mandatory=false readOnly=false __title='Enter the player version of the movie' textMode='singleline' maxLength=50 cssClass=''}
        </div>
    </fieldset>

    {if $mode ne 'create'}
        {include file='admin/include_standardfields_edit.tpl' obj=$movie}
    {/if}

    {* include display hooks *}
    {if $mode eq 'create'}
        {notifydisplayhooks eventname='muflash.ui_hooks.movies.form_edit' id=null assign='hooks'}
    {else}
        {notifydisplayhooks eventname='muflash.ui_hooks.movies.form_edit' id=$movie.id assign='hooks'}
    {/if}
    {if is_array($hooks) && isset($hooks[0])}
        <fieldset>
            <legend>{gt text='Hooks'}</legend>
            {foreach key='hookName' item='hook' from=$hooks}
            <div class="z-formrow">
                {$hook}
            </div>
            {/foreach}
        </fieldset>
    {/if}

    {* include return control *}
    {if $mode eq 'create'}
        <fieldset>
            <legend>{gt text='Return control'}</legend>
            <div class="z-formrow">
                {formlabel for='repeatcreation' __text='Create another item after save'}
                {formcheckbox group='movie' id='repeatcreation' readOnly=false}
            </div>
        </fieldset>
    {/if}

    {* include possible submit actions *}
    <div class="z-buttons z-formbuttons">
    {if $mode eq 'edit'}
        {formbutton id='btnUpdate' commandName='update' __text='Update movie' class='z-bt-save'}
      {if !$inlineUsage}
        {gt text='Really delete this movie?' assign='deleteConfirmMsg'}
        {formbutton id='btnDelete' commandName='delete' __text='Delete movie' class='z-bt-delete z-btred' confirmMessage=$deleteConfirmMsg}
      {/if}
    {elseif $mode eq 'create'}
        {formbutton id='btnCreate' commandName='create' __text='Create movie' class='z-bt-ok'}
    {else}
        {formbutton id='btnUpdate' commandName='update' __text='OK' class='z-bt-ok'}
    {/if}
        {formbutton id='btnCancel' commandName='cancel' __text='Cancel' class='z-bt-cancel'}
    </div>
  {/muflashFormFrame}
{/form}

</div>
{include file='admin/footer.tpl'}

{icon type='edit' size='extrasmall' assign='editImageArray'}
{icon type='delete' size='extrasmall' assign='deleteImageArray'}

<script type="text/javascript" charset="utf-8">
/* <![CDATA[ */
    var editImage = '<img src="{{$editImageArray.src}}" width="16" height="16" alt="" />';
    var removeImage = '<img src="{{$deleteImageArray.src}}" width="16" height="16" alt="" />';

    document.observe('dom:loaded', function() {

        muflashAddCommonValidationRules('movie', '{{if $mode eq 'create'}}{{else}}{{$movie.id}}{{/if}}');

        // observe button events instead of form submit
        var valid = new Validation('{{$__formid}}', {onSubmit: false, immediate: true, focusOnError: false});
        {{if $mode ne 'create'}}
            var result = valid.validate();
        {{/if}}

        $('{{if $mode eq 'create'}}btnCreate{{else}}btnUpdate{{/if}}').observe('click', function(event) {
            var result = valid.validate();
            if (!result) {
                // validation error, abort form submit
                Event.stop(event);
            } else {
                // hide form buttons to prevent double submits by accident
                $$('div.z-formbuttons input').each(function(btn) {
                    btn.hide();
                });
            }
            return result;
        });

        Zikula.UI.Tooltips($$('.muflashFormTooltips'));
    });

/* ]]> */
</script>

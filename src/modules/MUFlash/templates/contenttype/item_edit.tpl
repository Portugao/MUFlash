{* Purpose of this template: edit view of generic item list content type *}

<div class="z-formrow">
    {formlabel for='MUFlash_objecttype' __text='Object type'}
    {muflashSelectorObjectTypes assign='allObjectTypes'}
    {formdropdownlist id='MUFlash_objecttype' dataField='objectType' group='data' mandatory=true items=$allObjectTypes}
</div>
<div class="z-formrow">
    {formlabel for='MUFlash_id' __text='Id'}
    {formtextinput id='MUFlash_id' dataField='id' group='data' mandatory=true maxLength=2}
</div>

<div class="z-formrow">
    {formlabel for='MUFlash_template' __text='Template File'}
    {muflashSelectorTemplates assign='allTemplates'}
    {formdropdownlist id='MUFlash_template' dataField='template' group='data' mandatory=true items=$allTemplates}
</div>

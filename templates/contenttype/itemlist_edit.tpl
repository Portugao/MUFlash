{* Purpose of this template: edit view of generic item list content type *}

<div class="z-formrow">
    {formlabel for='MUFlash_objecttype' __text='Object type'}
    {muflashSelectorObjectTypes assign='allObjectTypes'}
    {formdropdownlist id='MUFlash_objecttype' dataField='objectType' group='data' mandatory=true items=$allObjectTypes}
</div>

<div class="z-formrow">
    {formlabel __text='Sorting'}
    <div>
        {formradiobutton id='MUFlash_srandom' value='random' dataField='sorting' group='data' mandatory=true}
        {formlabel for='MUFlash_srandom' __text='Random'}
        {formradiobutton id='MUFlash_snewest' value='newest' dataField='sorting' group='data' mandatory=true}
        {formlabel for='MUFlash_snewest' __text='Newest'}
        {formradiobutton id='MUFlash_sdefault' value='default' dataField='sorting' group='data' mandatory=true}
        {formlabel for='MUFlash_sdefault' __text='Default'}
    </div>
</div>

<div class="z-formrow">
    {formlabel for='MUFlash_amount' __text='Amount'}
    {formtextinput id='MUFlash_amount' dataField='amount' group='data' mandatory=true maxLength=2}
</div>

<div class="z-formrow">
    {formlabel for='MUFlash_template' __text='Template File'}
    {muflashSelectorTemplates assign='allTemplates'}
    {formdropdownlist id='MUFlash_template' dataField='template' group='data' mandatory=true items=$allTemplates}
</div>

<div class="z-formrow">
    {formlabel for='MUFlash_filter' __text='Filter (expert option)'}
    {formtextinput id='MUFlash_filter' dataField='filter' group='data' mandatory=false maxLength=255}
    <div class="z-formnote">({gt text='Syntax examples'}: <kbd>name:like:foobar</kbd> {gt text='or'} <kbd>status:ne:3</kbd>)</div>
</div>

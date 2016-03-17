<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/01
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String initialValue="Hello there"
/* THIS CODE NEEDS TO BE CHANGED
    // Toolbar configuration generated automatically by the editor based on config.toolbarGroups.
    config.toolbar = [
            { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
            { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
            { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
            { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
            '/',
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
            { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
            { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
            { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
            '/',
            { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
            { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
            { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
            { name: 'others', items: [ '-' ] },
            { name: 'about', items: [ 'About' ] }
    ];

// Toolbar groups configuration.
    config.toolbarGroups = [
            { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
            { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
            { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
            { name: 'forms' },
            '/',
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
            { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
            { name: 'links' },
            { name: 'insert' },
            '/',
            { name: 'styles' },
            { name: 'colors' },
            { name: 'tools' },
            { name: 'others' },
            { name: 'about' }
    ];
*/

%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

  <title>Page Editor</title>
    <ckeditor:resources/>
</head>
<body>
<h1>NicoCMS | Page Editor</h1>
<g:link controller="user" action="landingPage">Control Panel</g:link>
<br>
 <g:form action="save">
     <g:submitButton name="save" class="save" value="Save" />

<ckeditor:config
        height="350px"
        width="95%"
        uiColor= '#14B8C4'


/>

<ckeditor:config var="toolbar_Mytoolbar">
    [
        [ 'Source', '-', 'Bold', 'Italic','Underline',
          'Styles','Format','Font','FontSize', 'TextColor', 'BGColor','-','JustifyLeft','JustifyCenter','JustifyRight' ,'-', 'Cut','Copy','Paste','-', 'Link', 'Unlink' , 'Anchor' ,'-','Image','-','Find','Replace','SpellChecker','-','Outdent','Indent' ,'-', 'NumberedList', 'BulletedList','-','Table','HorizontalRule','PageBreak']
    ]
</ckeditor:config>

<ckeditor:editor name="myeditor" toolbar="Mytoolbar">
    ${initialValue}
</ckeditor:editor>
 </g:form>

 <ckeditor:fileBrowser>Open file browser</ckeditor:fileBrowser>


<g:link controller="user" action="logout">Logout</g:link><br>

</body>
</html>
%{--        http://docs.cksource.com/ckeditor_api/index.html       --}%
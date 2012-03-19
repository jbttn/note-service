# To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', (e) ->
  e.stopPropagation()
)

window.updatePreview = ->
  $.post('/markdownify', { note: editor.getValue() }, (data) ->
    $('#note-preview').html(data)
  )

$(() ->
  window.editor = CodeMirror.fromTextArea(document.getElementById("note_content"), {
    mode: 'gfm',
    lineNumbers: true,
    matchBrackets: true,
    theme: "default"
  })
)
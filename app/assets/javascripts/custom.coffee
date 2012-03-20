# To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', (e) ->
  e.stopPropagation()
)

window.updatePreview = ->
  $.post('/markdownify', { note: editor.getValue() }, (data) ->
    $('#note-preview').html(data)
  )
  
updateWindowHeight = ->
  verticalPadding = 80
  windowHeight = $(window).height()
  windowHeight -= verticalPadding
  $('#main-container').css('min-height', -> windowHeight)
  $('.stretch-container').height(windowHeight)
  
  # Fit codemirror in its parent container
  cmHeight = windowHeight - 160
  $('.CodeMirror-scroll').height(cmHeight)

$(() ->
  if(document.getElementById('note_content'))
    window.editor = CodeMirror.fromTextArea(document.getElementById('note_content'), {
      mode: 'gfm',
      lineNumbers: true,
      matchBrackets: true,
      theme: "default"
    })

  
  updateWindowHeight()
  
  $(window).resize(() ->
    updateWindowHeight()
  )
)
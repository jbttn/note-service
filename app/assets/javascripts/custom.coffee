# To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', (e) ->
  e.stopPropagation()
)

window.updatePreview = ->
  $.post('/markdownify', { note: editor.getValue() }, (data) ->
    $('#note-preview').html(data)
  )
  
updateWindowHeight = ->
  verticalPadding = 80 # 80 = 40 navbar, 20 top padding, 20 bottom padding
  windowHeight = $(window).height()
  windowHeight -= verticalPadding
  
  # Set the minimum height of the containers to be the window height
  $('#main-container').css('min-height', -> windowHeight)
  $('.stretch-container').css('min-height', -> windowHeight)
  # If the user resizes the window larger than the container then resize the container to fix the window height
  if($('.stretch-container').height() == windowHeight)
    $('.stretch-container').height(windowHeight)
  # If the user makes the window smaller, clear out the height property
  else
    $('.stretch-container').height(0)
  # Check if the children of the container are larger than the container itself, if so set the height of the container to the
  # size of the child container + 20 pixel padding
  $('.stretch-container').children().each ->
    if(this.scrollHeight > $('.stretch-container').height())
      $('.stretch-container').height(this.scrollHeight + 20)
  
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
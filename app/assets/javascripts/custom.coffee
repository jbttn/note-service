# To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', (e) ->
  e.stopPropagation()
)

# For updating the markdown preview in the note editor
window.updatePreview = ->
  $.post('/markdownify', { note: editor.getValue() }, (data) ->
    $('#note-preview').html(data)
  )

# Loads the users layout preference and adjusts any containers
window.loadWidth = ->
  if $.cookie('layout') == null
    $.cookie('layout', '0', { expires: 7, path: '/' })
    setLiquid()
    return this

  if $.cookie('layout') == '0'
    setFixed()
  else if $.cookie('layout') == '1'
    setLiquid()

# Toggles the cookie and loads the new layout preference
window.toggleWidth = ->
  if $.cookie('layout') == '0'
    setLiquid()
    $.cookie('layout', '1', { expires: 7, path: '/' })
  else
    setFixed()
    $.cookie('layout', '0', { expires: 7, path: '/' })
# Go from liquid to fixed
setFixed = ->
  time = 0
  $('.container-fluid').switchClass('container-fluid', 'container', time)
  $('.row-fluid').switchClass('row-fluid', 'row', time)
# Go from fixed to liquid
setLiquid = ->
  time = 0
  $('.container').switchClass('container', 'container-fluid', time)
  $('.row').switchClass('row', 'row-fluid', time)

# Ensures the content stretches to the bottom of the window
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

# Do some stuff when the DOM is loaded...
$(() ->
  if(document.getElementById('note_content'))
    window.editor = CodeMirror.fromTextArea(document.getElementById('note_content'), {
      mode: 'gfm',
      lineNumbers: true,
      matchBrackets: true,
      theme: "default"
    })

  updateWindowHeight()
  
  #loadWidth()
  
  $(window).resize(() ->
    updateWindowHeight()
  )
)
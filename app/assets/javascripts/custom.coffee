# To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', (e) ->
  e.stopPropagation()
)

window.updatePreview = ->
  $.post('/markdownify', { note: $('textarea').val() }, (data) ->
    $('#note-preview').html(data)
  )
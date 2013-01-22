# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  tg = (el) ->
    updateInstructions = ->
      if el.hasClass('expanded')
        source = 'hide'
      else
        source = 'show'
      el.text(el.data(source))

    updateInstructions()

    el.click ->
      $('table.jokes .joke-preview').click()
      el.toggleClass('expanded')
      updateInstructions()
      false
  tg($('.toggle-all'))

  $('table.jokes .joke-preview').click ->
    target_row_id = $(this).attr("id")
    details = $("div[data-toggle='#{target_row_id}']")
    details.toggle()

    player = $('.yt', details)

    new YT.Player(player.attr('id'), {
       height: '390'
       width: '640'
       videoId: player.data('yt-id')
     })

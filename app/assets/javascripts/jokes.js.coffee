# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('table.jokes tr').click ->
    target_row_id = $(this).attr("id")
    $("div[data-toggle='#{target_row_id}']").toggle()

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('div.btn-danger').click ->
    id = $(this).attr('id')
    $.ajax(url:'/del_stages', type:'GET', dataType:'html', success: ->
      $(this).remove()
    )
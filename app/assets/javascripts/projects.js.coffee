# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  flag = false
  $('div.btn-danger').click ->
    id = $(this).attr('id')
    $.ajax(url:'/stages/destroy/', type:'GET',data:{'id': id}, dataType:'html', success: ->
      $(this).parent.remove()
    )

  $('div.btn-warning').click ->
    id = $(this).attr('id')
    $('add_stage_form').show()
    $('#add_stage_field').val($(this).parent.find('label').html)
    flag = true

  $('#add_stage_button').click ->
    $('.add_stage_form').show()

  $('#post_stage_button').click ->
    if flag
      url = '/stages/update'
    else
      url = '/stages/create'
    $.ajax(url:url, type:'POST', dataType:'html', success: ->
      $('#add_stage_field').val('')
      $('.add_stage_form').hide()
    )
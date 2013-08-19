# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

render = (item) ->
show_notification = (item) ->
  title = 'Новая задача!'
  content = item.title
  window.webkitNotifications.createNotification('icon.png', title, content).show()
  true

refresh = ->
  $.getJSON '/refresh', (json) ->
    if json.length>0
      $(json).each ->
        render(this)
        show_notification(this)
        true
    console.log(json.length)
if window.webkitNotifications.checkPermission() == 0
  setInterval(refresh, 10000)


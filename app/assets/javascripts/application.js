// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap.min.js
//
$(document).ready( function() {
    if (window.webkitNotifications) {
        console.log('Notifications are supported!');
    } else {
        console.log('Notification are not supported!');
    }
    $('#require_permission').click(function () {
        if (window.webkitNotifications.checkPermission() == 0) {
            window.webkitNotifications.createNotification('icon.png', 'Test', 'test').show();
        } else {
            window.webkitNotifications.requestPermission();
        }
    });
});
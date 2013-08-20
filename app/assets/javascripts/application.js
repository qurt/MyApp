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
    $('a').tooltip({
    });

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

    $('#project_user_tokens').tokenInput('/user_field.json', {
        crossDomain: false,
        prePopulate: $('#project_user_tokens').data('pre'),
        theme: 'facebook'
    });

    var refresh, render, show_notification;

    show_notification = function(item) {
        var content, title;
        title = 'Новая задача!';
        content = item.title;
        window.webkitNotifications.createNotification('icon.png', title, content).show();
        return true;
    };

    refresh = function() {
        return $.getJSON('/refresh', function(json) {
            if (json.length > 0) {
                $(json).each(function() {
                    show_notification(this);
                    return true;
                });
            }
            return console.log(json.length);
        });
    };

    if (window.webkitNotifications.checkPermission() === 0) {
        setInterval(refresh, 10000);
    }
});
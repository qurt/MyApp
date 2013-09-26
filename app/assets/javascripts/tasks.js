$(document).ready(function() {
	$('#subtask').change(function() {
		var post = null;
		var val_id = $(this).attr('value');
		var val_check = $(this).prop('checked');

		$.post('/subtasks', { id: val_id, check: val_check});		
	});

    var flag=false;
    var id = 0;
    $('div.btn-danger').click(function() {
        id = $(this).attr('id');
        $.ajax({
            url: '/subtasks/destroy',
            type: 'GET',
            data: {'id': id},
            dataType: 'html',
            success: function() {
                $(this).parent().remove()
            }
        });
    });
    $('div.btn-warning').click(function() {
        id = $(this).attr('id');
        $('.add_subtask_form').show();
        $('#add_subtask_field').val($(this).parent().find('label').html);
        flag = true;
    });
    $('#add_subtask_button').click(function() {
        $('.add_subtask_form').show();
    });
    $('#post_subtask_button').click(function() {
        var url = '';
        if (flag) {
            url = '/subtask/update/'+id;
        } else {
            url = '/subtask/create';
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'html',
            success: function() {
                $('#add_subtask_field').val('');
                $('.add_subtask_form').hide();
            }
        });
    });
});
function update_stages(project_id) {
    $.ajax({
        url: '/update_stages',
        type: 'GET',
        data: {'project_id' : project_id},
        dataType: 'html',
        success: function(data) {
            $('#stages_box').html(data);
        }
    });
}
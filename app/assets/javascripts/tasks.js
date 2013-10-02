$(document).ready(function() {
	$('#subtask').change(function() {
		var post = null;
		var val_id = $(this).attr('value');
		var val_check = $(this).prop('checked');

		$.post('/subtasks', { id: val_id, check: val_check});		
	});

    var flag=false;
    var id = 0;
    $('span.btn-delete').click(function() {
        id = $(this).attr('id');
        var subtask = $(this).parent();
        $.ajax({
            url: '/subtasks/destroy',
            type: 'GET',
            data: {'id': id},
            dataType: 'html',
            success: function() {
                $(subtask).remove()
            }
        });
    });
    $('span.btn-edit').click(function() {
        id = $(this).attr('id');
        $.get('/subtask/get_subtask', {id: id}, function(data) {
            console.log(data);
            $('#myEditModal').find('.modal-content').html(data);
            $('#myEditModal').modal('show');
        });
        flag = true;
    });
    $('#post_subtask_button').click(function() {
        var url = '';
        if (flag) {
            url = '/subtask/update/'+id;
        } else {
            url = '/subtask/create';
        }
        var title = $('#add_subtask_field').val();
        var task_id = $('#task_id').val();

        var data = 'task_id='+task_id+'&title='+title;
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'html',
            success: function() {
                $('#myModal').modal('hide');
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
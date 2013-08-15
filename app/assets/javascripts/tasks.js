$(document).ready(function() {
	$('.btn-success').click(function() {
		$('.subtask_item_box').append('<div class="subtask_item"><input id="subtask_title_" class="form-control" name="subtask_title[]" type="text"></div><div style="clear: both"></div>');
	});
	$('.btn-danger').click(function() {
		$(this).parent().remove();
	});

	$('#subtask').change(function() {
		var post = null;
		var val_id = $(this).attr('value');
		var val_check = $(this).prop('checked');

		$.post('/subtasks', { id: val_id, check: val_check});		
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
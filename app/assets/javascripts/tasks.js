$(document).ready(function() {
	$('#add_new_subtask').click(function() {
		$('#subtasks_field').append('<br /><input id="subtask_title_" name="subtask_title[]" type="text">');
	});
	$('.delete_subtask').click(function() {
		$(this).parent().remove();
	});

	$('#subtask').change(function() {
		var post = null;
		var val_id = $(this).attr('value');
		var val_check = $(this).prop('checked');

		$.post('/subtasks', { id: val_id, check: val_check});		
	})
});
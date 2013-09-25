$(document).ready(function() {
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
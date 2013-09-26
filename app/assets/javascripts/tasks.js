$(document).ready(function() {
	$('#subtask').change(function() {
		var post = null;
		var val_id = $(this).attr('value');
		var val_check = $(this).prop('checked');

		$.post('/subtasks', { id: val_id, check: val_check});		
	});

    var flag=false;
    $('div.btn-danger').click(function() {
        var id = $(this).attr('id');
        $.ajax({
            url: 'subtasks/destroy',
            type: 'GET',
            data: {'id': id},
            dataType: 'html',
            success: function() {
                $(this).parent().remove()
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
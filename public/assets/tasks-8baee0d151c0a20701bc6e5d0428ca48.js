function update_stages(t){$.ajax({url:"/update_stages",type:"GET",data:{project_id:t},dataType:"html",success:function(t){$("#stages_box").html(t)}})}$(document).ready(function(){$(".btn-success").click(function(){$(".subtask_item_box").append('<div class="subtask_item"><input id="subtask_title_" class="form-control" name="subtask_title[]" type="text"></div><div style="clear: both"></div>')}),$(".btn-danger").click(function(){$(this).parent().remove()}),$("#subtask").change(function(){var t=$(this).attr("value"),s=$(this).prop("checked");$.post("/subtasks",{id:t,check:s})})});
class SubtasksController < ApplicationController
	def index
		id = params[:id]
		checked = params[:check]
		task = Subtask.find(id)
		if task
			if checked == "false"
				if task.update_attributes(:active => true)
					render :json => {:error => 'none', :msg => 'task active'}
				else
					render :json => {:error => 'fail', :msg => task.errors }
				end
			else 
				if task.update_attributes(:active => false)
					render :json => {:error => 'none', :msg => 'task inactive'}
				else
					render :json => {:error => 'fail', :msg => task.errors }
				end
			end
		end
	end
end
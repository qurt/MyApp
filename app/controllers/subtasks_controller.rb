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

  def get_subtask
    @item = Subtask.find(params[:id])
    render :partial => 'tasks/subtask', :object => @item
  end

  def create
    @subtask = Subtask.new
    @subtask.title = params[:title]
    @subtask.task_id = params[:task_id]

    respond_to do |format|
      if @subtask.save
        format.json { head :no_content }
      else
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subtask = Subtask.find(params[:id])

    if @subtask.update_attributes(params[:subtask])
      head :no_content
    else
      format.json { render json: @subtask.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    @subtask.destroy

    head :no_content
  end

end
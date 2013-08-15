class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @stages = Stage.all
    if params[:project_id]
      project = Project.find(params[:project_id])
      @users = project.users
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @users = @task.project.users
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    sub_tasks = params[:subtask_title]
    @task.stage_id = params[:stages]
    if sub_tasks
      sub_tasks.each do |sub_task|
        if sub_task != ''
          sub = Subtask.new
          sub.title = sub_task
          sub.user_id = 0
          @task.subtasks << sub
        end
      end
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to feed_url, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @task.subtasks.clear
    sub_tasks = params[:subtask_title]
    if sub_tasks
      sub_tasks.each do |sub_task|
        if sub_task != ''
          sub = Subtask.new
          sub.title = sub_task
          @task.subtasks << sub
        end
      end
    end


    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to feed_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def complete 
    task = Task.find(params[:id])
    task.active = false
    task.status = 2
    task.save
    redirect_to root_url
  end
  def uncomplete
    task = Task.find(params[:id])
    task.status = 0
    task.save
    redirect_to '/check'
  end
  def ready
    task = Task.find(params[:id])
    current_user = User.find(session[:user_id]).id
    if task.owner_id == current_user
      task.status = 2
      task.active = false
    else
      task.status = 1
    end

    task.save
    redirect_to root_url
  end
  def check
    @tasks = Task.where('owner_id = ? AND status = ?', session[:user_id], 1)
    @current_tasks = Task.where(:owner_id => session[:user_id], :status => 0)
    render 'check'
  end

  def update_stages
    @stages = Stage.where(:project_id => params[:project_id])
    render :partial => 'stages', :object => @stages
  end
end

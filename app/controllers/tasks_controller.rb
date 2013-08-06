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
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @users = User.all
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    users_list = params[:users]
    if users_list
      users_list.each do |item|
        user_to_add = User.find_by_id(item)
        @task.users << user_to_add
      end
    end
    sub_tasks = params[:subtask_title]
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
    @task.users.clear
    @task.subtasks.clear
    users_list = params[:users]
    if users_list
      users_list.each do |item|
        if !@task.users.find_by_id(item)
          user_to_add = User.find_by_id(item)
          @task.users << user_to_add
        end
      end
    end
    sub_tasks = params[:subtask_title]
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
    task.save
    render :json => {:error => 'none', :msg => 'Task complete!'}
  end
end

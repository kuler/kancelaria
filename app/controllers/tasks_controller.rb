class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.order("planned_to_start_at DESC, started_at DESC")


    respond_to do |format|
      format.html # index.html.erb
      format.json {         
        @tasks.reject! do |t|
          t.planned_at.from ==nil
        end
        render json: @tasks.map { |t|
          { 
            'title' => t.type.name + ' ' + t.name + (t.assignee ? ' '+t.assignee.name : ''),
            'start' => t.planned_at.from,
            'end' => t.planned_at.to,
            'backgroundColor' => t.type.color,
            'url' => edit_task_path(t),
            'allDay' => false
          } 
        }
      }
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.author = current_user
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
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

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
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

  def selfassign
    @task = Task.find(params[:id])
    @task.assignee = current_user
    @task.save

    respond_to do |format|
        format.html { redirect_to tasks_path, notice: t('ok') }
        format.json { render json: @task, status: :created, location: @task }
    end
  end
  def selfresign
    @task = Task.find(params[:id])
    @task.assignee = nil
    @task.save

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: t('ok') }
      format.json { render json: @task, status: :created, location: @task }
    end
  end
end

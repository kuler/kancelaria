class ActivitiesController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    conditions = {}

    conditions[:task_type_id] = params[:task_type] if(params[:task_type])

    if current_user.admin
      conditions[:assignee_user_id] = [params[:user],nil] if(params[:user])
    else
      conditions[:assignee_user_id] = [current_user.id, nil]
    end

    if params[:client]
      @activities = Activity.joins(:case).where( :cases => { :client_id => params[:client]} ).all(:conditions => conditions)
    else
      @activities = Activity.all(:conditions => conditions)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json {         
        @activities.reject! do |t|
          t.planned_at.from ==nil
        end
        render json: @activities.map { |t|
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
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /tasks/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @activity = Activity.new(params[:activity])
    @activity.author = current_user
    @activity.assignee = current_user
    
    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_path, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to activities_path, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end

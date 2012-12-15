class CalendarController < ApplicationController

  def default_filters
    {
      :activities=>true,
      :tasks=>true
    }
  end

  def filter
    
    @filters = session[:calendar_filters] ? session[:calendar_filters] : default_filters
  
    if params[:toggle]
      if params[:toggle] == "activities"
        @filters[:activities] = !@filters[:activities]
      end
      if params[:toggle] == "tasks" 
        @filters[:tasks] = !@filters[:tasks] 
      end
      session[:calendar_filters] = @filters
    end
    respond_to do |format|
      format.json {         
          render json: @filters 
        }
    end
  end
  
  def index
    
    @filters = session[:calendar_filters] ? session[:calendar_filters] : default_filters
  
    events = []
  
    if @filters[:tasks]
      @tasks = Task.all
      events+= @tasks.map { |t|
                { 
                  'title' => t.type.name + ' ' + t.name + (t.assignee ? ' '+t.assignee.name : ''),
                  'start' => t.planned_at,
                  'end' => (t.planned_at + 1.hour),
                  'backgroundColor' => t.type.color,
                  'url' => edit_task_path(t),
                  'allDay' => false
                } 
                }
    end
    
    if @filters[:activities]
      @activities = Activity.all
      events+= @activities.map { |t|
                { 
                  'title' => t.type.name + ' ' + t.name + (t.assignee ? ' '+t.assignee.name : ''),
                  'start' => t.completed_at,
                  'end' => (t.completed_at + 1.hour),
                  'backgroundColor' => t.type.color,
                  'url' => edit_task_path(t),
                  'allDay' => false
                }
                }
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json {         
          render json: events 
        }
    end
  end
end

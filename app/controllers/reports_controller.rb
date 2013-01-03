class ReportsController < ApplicationController

  def default_options
    {
    :scope => :user
    }
  end

  def index

    @options = default_options
    @options = session[:report_options] if session[:report_options]

    case @options[:scope]
      when :user
        @data = user_report @options
      when :client
        @data = client_report @options
    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def user_report options

    ret = {}

    subject = User.all if not options[:filter_id]

    subject.each do |user|
      ret[user.id]={
          :subject_label=>user.firstname+' '+user.lastname,
          :subject_link=>"/",
          :subject_activities=>Activity.where('assignee_user_id'=>user.id)
      }
    end

    return ret
  end

  def client_report options
    return {}
  end
end


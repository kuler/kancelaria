class ReportsController < ApplicationController

  def default_options
    {
    :scope => :user,
    :client => :all,
    :user => :all
    }
  end

  def current_options
    options = default_options
    options = session[:report_options] if session[:report_options]

    if params[:ropts]

      params[:ropts][:client].reject! { |c| c.empty? }
      params[:ropts][:user].reject! { |c| c.empty? }

      if params[:ropts][:client].empty?
        options[:client]=:all
      else
        options[:client]=params[:ropts][:client]
      end
      if params[:ropts][:user].empty?
        options[:user]=:all
      else
        options[:user]=params[:ropts][:user]
      end

      options[:scope]=:user if params[:commit]==t(:report_user)
      options[:scope]=:client if params[:commit]==t(:report_client)

      session[:report_options] = options
    end



    return options
  end

  def index

    @options = current_options

    @clients = Client.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def result

    @options = current_options

    @clients = Client.all
    @users = User.all

    case @options[:scope]
      when :user
        @data = user_report @options
      when :client
        @data = client_report @options
    end

    respond_to do |format|
      format.html # result.html.erb
    end
  end

  def user_report options

    ret = {}

    subject = @options[:user] == :all ? User.all : User.find(@options[:user])

    subject.each do |user|
      activities = Activity.where('assignee_user_id'=>user.id)
      if @options[:client]!=:all
        activities.reject! { |a| !@options[:client].include? a.case.client.id.to_s }
      end

      break if activities.empty?

      ret[user.id]={
          :subject_label=>user.firstname+' '+user.lastname,
          :subject_link=>"/",
          :subject_activities=>activities,
          :subtotal_real => activities.map {|a| a.hours_real}.sum,
          :subtotal_invoice => activities.map{|a| a.hours_invoice}.sum
      }
    end

    return ret
  end

  def client_report options
    ret = {}

    subject = @options[:client] == :all ? Client.all : Client.find(@options[:client])

    subject.each do |client|
      activities = Activity.includes(:assignee).joins(:case).where(:cases=>{:client_id=>client.id})
      if @options[:user]!=:all
        activities = Activity.includes(:assignee).joins(:case).where(:cases=>{:client_id=>client.id}, :assignee_user_id=>@options[:user])
      end
      break if activities.empty?
      ret[client.id]={
          :subject_label=>client.shortname+'/'+client.fullname,
          :subject_link=>"/",
          :subject_activities=>activities,
          :subtotal_real => activities.map {|a| a.hours_real}.sum,
          :subtotal_invoice => activities.map{|a| a.hours_invoice}.sum
      }
    end

    return ret
  end
end


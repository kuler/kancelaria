class CasesController < ApplicationController
  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.find(:all, :conditions => {:active => true})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cases }
    end
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @case = Case.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @case }
    end
  end

  # GET /cases/new
  # GET /cases/new.json
  def new
    @case = Case.new
    @clients = Client.find(:all, :conditions => {:active => true})

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @case }
    end
  end

  # GET /cases/1/edit
  def edit
    @case = Case.find(params[:id])
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(params[:case])
    @case.active = true
    @case.user = current_user 
    
    respond_to do |format|
      if @case.save
        format.html { redirect_to cases_url, notice: t('client was successfully created') }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cases/1
  # PUT /cases/1.json
  def update
    @case = Case.find(params[:id])

    respond_to do |format|
      if @case.update_attributes(params[:client])
        format.html { redirect_to cases_url, notice: t('changes_saved') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case = Case.find(params[:id])
    @case.update_attribute :active, false

    respond_to do |format|
      format.html { redirect_to cases_url }
      format.json { head :no_content }
    end
  end
end

class NextActionsController < ApplicationController
  # GET /actions
  # GET /actions.json
  def index
    @next_actions = current_user.next_actions 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @next_actions }
    end
  end

  # GET /actions/1
  # GET /actions/1.json
  def show
    @next_action = Action.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @next_action }
    end
  end

  # GET /actions/new
  # GET /actions/new.json
  def new
    @next_action = current_user.actions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @next_action }
    end
  end

  # GET /actions/1/edit
  def edit
    @next_action = Action.find(params[:id])
  end

  # POST /actions
  # POST /actions.json
  def create
    
    if params[:project_id]
      project = Project.find(params[:project_id])
      @next_action = current_user.actions.build(params[:act])
      @next_action.project_id = project.id
      
      respond_to do |format|
        if @next_action.save
          format.html { redirect_to project, notice: 'Action was successfully created.' }
          format.json { render json: @next_action, status: :created, location: @next_action }
        else
          format.html { render action: "new" }
          format.json { render json: @next_action.errors, status: :unprocessable_entity }
        end
      end

    else
      @next_action = current_useractions.build(params[:act])

      respond_to do |format|
        if @next_action.save
          format.html { redirect_to @next_action, notice: 'Action was successfully created.' }
          format.json { render json: @next_action, status: :created, location: @next_action }
        else
          format.html { render action: "new" }
          format.json { render json: @next_action.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /actions/1
  # PUT /actions/1.json
  def update
    @next_action = Action.find(params[:id])

    respond_to do |format|
      if @next_action.update_attributes(params[:act])
        format.html { redirect_to @next_action, notice: 'Action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @next_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actions/1
  # DELETE /actions/1.json
  def destroy
    @next_action = Action.find(params[:id])
    @next_action.destroy

    respond_to do |format|
      format.html { redirect_to actions_url }
      format.json { head :no_content }
    end
  end
end

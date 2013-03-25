class StuffController < ApplicationController
  # GET /stuff
  # GET /stuff.json
  def index
    @stuff = current_user.stuff #Stuff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stuff }
    end
  end

  # GET /stuff/1
  # GET /stuff/1.json
  def show
    @stuff = Stuff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stuff }
    end
  end

  # GET /stuff/new
  # GET /stuff/new.json
  def new
    @stuff = current_user.stuff.build #Stuff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stuff }
    end
  end

  # GET /stuff/1/edit
  def edit
    @stuff = Stuff.find(params[:id])
  end

  # POST /stuff
  # POST /stuff.json
  def create
    @stuff = current_user.stuff.build(params[:stuff])

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to '/stuff', notice: 'Stuff was successfully created.' }
        format.json { render json: @stuff, status: :created, location: @stuff }
      else
        format.html { render action: "new" }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stuff/1
  # PUT /stuff/1.json
  def update
    @stuff = Stuff.find(params[:id])

    respond_to do |format|
      if @stuff.update_attributes(params[:stuff])
        if params[:commit] == "Save"
          format.html { redirect_to @stuff }
          format.json { head :no_content }
        elsif params[:commit] == "To Project"
          project = @stuff.make_project current_user
          @stuff.destroy

          format.html { redirect_to @stuff, notice: "Added new project: #{project.name}" }
          format.json { head :no_content }
        elsif params[:commit] == "Next Action"
          action = @stuff.make_action current_user
          @stuff.destroy

          format.html { redirect_to @stuff, notice: "Added new next action: #{action.description}" }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuff/1
  # DELETE /stuff/1.json
  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy

    respond_to do |format|
      format.html { redirect_to stuff_index_url }
      format.json { head :no_content }
    end
  end
end

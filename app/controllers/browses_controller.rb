
class BrowsesController < ApplicationController
  # GET /browses
  # GET /browses.json
  def index
    @browses = Browse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @browses }
    end
  end

  # GET /browses/1
  # GET /browses/1.json
  def show
    @browse = Browse.find(params[:id])
    logger.warn "Browse object: " + @browse.to_s
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @browse.doc }
    end
  end

  # GET /browses/new
  # GET /browses/new.json
  def new
    @browse = Browse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @browse }
    end
  end

  # GET /browses/1/edit
  def edit
    @browse = Browse.find(params[:id])
  end

  # POST /browses
  # POST /browses.json
  def create
    @browse = Browse.new

    respond_to do |format|
      if @browse.save
        format.html { redirect_to @browse, notice: 'Browse was successfully created.' }
        format.json { render json: @browse, status: :created, location: @browse }
      else
        format.html { render action: "new" }
        format.json { render json: @browse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /browses/1
  # PUT /browses/1.json
  def update
    @browse = Browse.find(params[:id])

    respond_to do |format|
      if @browse.update_attributes(params[:browse])
        format.html { redirect_to @browse, notice: 'Browse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @browse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /browses/1
  # DELETE /browses/1.json
  def destroy
    @browse = Browse.find(params[:id])
    @browse.destroy

    respond_to do |format|
      format.html { redirect_to browses_url }
      format.json { head :no_content }
    end
  end
end

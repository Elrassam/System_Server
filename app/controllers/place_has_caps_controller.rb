class PlaceHasCapsController < ApplicationController
  # GET /place_has_caps
  # GET /place_has_caps.json
  def index
    @place_has_caps = PlaceHasCap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @place_has_caps }
    end
  end

  # GET /place_has_caps/1
  # GET /place_has_caps/1.json
  def show
    @place_has_cap = PlaceHasCap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place_has_cap }
    end
  end

  # GET /place_has_caps/new
  # GET /place_has_caps/new.json
  def new
    @place_has_cap = PlaceHasCap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place_has_cap }
    end
  end

  # GET /place_has_caps/1/edit
  def edit
    @place_has_cap = PlaceHasCap.find(params[:id])
  end

  # POST /place_has_caps
  # POST /place_has_caps.json
  def create
    @place_has_cap = PlaceHasCap.new(params[:place_has_cap])

    respond_to do |format|
      if @place_has_cap.save
        format.html { redirect_to @place_has_cap, notice: 'Place has cap was successfully created.' }
        format.json { render json: @place_has_cap, status: :created, location: @place_has_cap }
      else
        format.html { render action: "new" }
        format.json { render json: @place_has_cap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /place_has_caps/1
  # PUT /place_has_caps/1.json
  def update
    @place_has_cap = PlaceHasCap.find(params[:id])

    respond_to do |format|
      if @place_has_cap.update_attributes(params[:place_has_cap])
        format.html { redirect_to @place_has_cap, notice: 'Place has cap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place_has_cap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_has_caps/1
  # DELETE /place_has_caps/1.json
  def destroy
    @place_has_cap = PlaceHasCap.find(params[:id])
    @place_has_cap.destroy

    respond_to do |format|
      format.html { redirect_to place_has_caps_url }
      format.json { head :no_content }
    end
  end
end

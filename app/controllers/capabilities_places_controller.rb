class CapabilitiesPlacesController < ApplicationController
  # GET /capabilities_places
  # GET /capabilities_places.json
  def index
    @capabilities_places = CapabilitiesPlace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capabilities_places }
    end
  end

  # GET /capabilities_places/1
  # GET /capabilities_places/1.json
  def show
    @capabilities_place = CapabilitiesPlace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capabilities_place }
    end
  end

  # GET /capabilities_places/new
  # GET /capabilities_places/new.json
  def new
    @capabilities_place = CapabilitiesPlace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capabilities_place }
    end
  end

  # GET /capabilities_places/1/edit
  def edit
    @capabilities_place = CapabilitiesPlace.find(params[:id])
  end

  # POST /capabilities_places
  # POST /capabilities_places.json
  def create
    @capabilities_place = CapabilitiesPlace.new(params[:capabilities_place])

    respond_to do |format|
      if @capabilities_place.save
        format.html { redirect_to @capabilities_place, notice: 'Capabilities place was successfully created.' }
        format.json { render json: @capabilities_place, status: :created, location: @capabilities_place }
      else
        format.html { render action: "new" }
        format.json { render json: @capabilities_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capabilities_places/1
  # PUT /capabilities_places/1.json
  def update
    @capabilities_place = CapabilitiesPlace.find(params[:id])

    respond_to do |format|
      if @capabilities_place.update_attributes(params[:capabilities_place])
        format.html { redirect_to @capabilities_place, notice: 'Capabilities place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @capabilities_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capabilities_places/1
  # DELETE /capabilities_places/1.json
  def destroy
    @capabilities_place = CapabilitiesPlace.find(params[:id])
    @capabilities_place.destroy

    respond_to do |format|
      format.html { redirect_to capabilities_places_url }
      format.json { head :no_content }
    end
  end
end

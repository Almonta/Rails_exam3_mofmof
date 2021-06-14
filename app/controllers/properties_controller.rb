class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
    @nearest_station = @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path
      else
        render :new
      end
    end
  end

  def update
    if @property.update(property_params)
    redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_name, :rent, :address, :age, :remarks,
    nearest_stations_attributes: [ :route_name, :station_name, :time, :property_id, :id ])
  end

end

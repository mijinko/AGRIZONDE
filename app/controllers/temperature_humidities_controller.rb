class TemperatureHumiditiesController < ApplicationController
  before_action :set_temperature_humidity, only: [:show, :edit, :update, :destroy]

  # GET /temperature_humidities
  # GET /temperature_humidities.json
  def index
    puts 'temperature_humidities index start'
    #@temperature_humidities = TemperatureHumidity.all
    #@temperature_humidity = TemperatureHumidity.new
  end

  # GET /temperature_humidities/1
  # GET /temperature_humidities/1.json
  def show
  end

  # GET /temperature_humidities/new
  def new
    @temperature_humidity = TemperatureHumidity.new
  end

  # GET /temperature_humidities/1/edit
  def edit
  end

  # POST /temperature_humidities
  # POST /temperature_humidities.json
  def create
    #@temperature_humidity = TemperatureHumidity.new(temperature_humidity_params)
    @temperature_humidity = TemperatureHumidity.new
    respond_to do |format|
      #if @temperature_humidity.save
        format.html { redirect_to  notice: 'Temperature humidity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @temperature_humidity }
      #else
      #  format.html { render action: 'new' }
      #  format.json { render json: @temperature_humidity.errors, status: :unprocessable_entity }
      #end
    end
  end

  # PATCH/PUT /temperature_humidities/1
  # PATCH/PUT /temperature_humidities/1.json
  def update
    respond_to do |format|
      if @temperature_humidity.update(temperature_humidity_params)
        format.html { redirect_to @temperature_humidity, notice: 'Temperature humidity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @temperature_humidity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperature_humidities/1
  # DELETE /temperature_humidities/1.json
  def destroy
    @temperature_humidity.destroy
    respond_to do |format|
      format.html { redirect_to temperature_humidities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature_humidity
      @temperature_humidity = TemperatureHumidity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperature_humidity_params
      params.require(:temperature_humidity).permit(:date, :time, :temperature, :humidity)
    end
end

class TemperatureHumiditiesController < ApplicationController
  #require 'csv'

  layout 'common_layout'

  before_action :set_temperature_humidity, only: [:show, :edit, :update, :destroy]

  # GET /temperature_humidities
  # GET /temperature_humidities.json
  def index
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
  # 画面から入力された温湿度ロガーデータCSVファイルを、データベースに挿入または更新する
  def create
    puts 'temperature_humidities create start'
    puts params
    # CSVファイル取得
    file_data_csv = params[:temp_hum_file_path].read
    puts file_data_csv

    # TODO 以下の処理を、modelで行う
    # CSVファイルを走査する

    # 行の種類を判定

    # データ行の場合、行をカンマで分割

    # 同じ日付のデータが既に入っているか確認

    # 同じ日付のデータが既に入っていない場合、日付、場所、温度、湿度を挿入する

    # 同じ日付のデータが既に入っていた場合、同じ日付のデータをいったん削除し、新しいデータの日付、場所、温度、湿度を挿入する


    @temperature_humidity = TemperatureHumidity.new

    flash[:notice] = 'aaa'
    redirect_to

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

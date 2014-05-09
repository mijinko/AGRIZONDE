# coding: utf-8
class DataReferenceController < ApplicationController
  layout 'common_layout'

  def index
    puts 'data_reference_controller index start'
  end

  def show_data
    puts 'data_reference_controller show_data start'
    @date = params[:date]

    # データを取得
    graph_datas = TemperatureHumidity.get_TemperaturHumidites_where_log_date_order_by_log_time(params[:date])

    @graph_data_log_time = []
    @graph_data_temperature = []
    @graph_data_humidity = []
    graph_datas.each do |graph_data|
      # グラフ表示用の時間
      @graph_data_log_time.push(graph_data[:log_time])
      # グラフ表示用の温度
      @graph_data_temperature.push(graph_data[:temperature])
      # グラフ表示用の湿度
      @graph_data_humidity.push(graph_data[:humidity])
    end

    # 平均温度

    # 最大温度

    # 最小温度

    # 平均湿度

    # 最大湿度

    # 最小湿度

  end
end

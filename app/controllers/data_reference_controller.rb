# coding: utf-8
class DataReferenceController < ApplicationController
  layout 'common_layout'
  def index
    puts 'data_reference_controller index start'
  end

  def show_data
    puts 'data_reference_controller show_data start'
    @test = '試験'
    # redirect_to
  end
end

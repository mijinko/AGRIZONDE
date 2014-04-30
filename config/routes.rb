AGRIZONDE::Application.routes.draw do
  get "data_reference/index"
  get "data_reference/show_data"
  resources :temperature_humidities

  # welcomeページ
  root :controller => 'temperature_humidities', :action => 'index'

end

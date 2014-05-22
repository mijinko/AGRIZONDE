AGRIZONDE::Application.routes.draw do
  resources :events

  get "data_reference/index"
  get "data_reference/show_data"
  resources :temperature_humidities

  # welcomeページ
  root :controller => 'temperature_humidities', :action => 'index'

end

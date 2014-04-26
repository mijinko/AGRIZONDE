AGRIZONDE::Application.routes.draw do
  resources :temperature_humidities

  # welcomeページ
  root :controller => 'temperature_humidities', :action => 'index'

end

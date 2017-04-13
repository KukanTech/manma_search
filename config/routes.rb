Rails.application.routes.draw do
  resources :locations, :only => [:index, :create]
  get 'locations/search'
end

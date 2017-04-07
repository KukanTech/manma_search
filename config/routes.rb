Rails.application.routes.draw do

  resources :locations
  get 'locations/search'

end

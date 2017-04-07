Rails.application.routes.draw do

  resources :locations, :only => [:index]
  get 'locations/search'

end

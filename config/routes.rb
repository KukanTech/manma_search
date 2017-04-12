Rails.application.routes.draw do

  resources :locations, :only => [:index]
  get 'locations/search'
  post 'locations/new', to: 'locations#new'
end

Rails.application.routes.draw do

  get '/locations/search', to: 'locations#search'

end

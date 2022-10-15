Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/seasons', to: 'seasons#index'
  get '/seasons/new', to: 'seasons#new'
  get '/seasons/:id', to: 'seasons#show'
  get '/seasons/:id/edit', to: 'seasons#edit'

  post '/seasons', to: 'seasons#create'

  patch '/seasons/:id', to: 'seasons#update'

  get '/seasons/:id/storms', to: 'season_storms#index'

  get '/seasons/:id/storms/new', to: 'season_storms#new'
  post '/seasons/:id/storms', to: 'season_storms#create'

  get '/storms', to: 'storms#index'
  get '/storms/:id', to: 'storms#show'
end

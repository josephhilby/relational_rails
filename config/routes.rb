Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/seasons', to: 'seasons#index'
  post '/seasons', to: 'seasons#create'
  get '/seasons/new', to: 'seasons#new'
  get '/seasons/:id', to: 'seasons#show'
  patch '/seasons/:id' to: 'seasons#update'
  get '/seasons/:id/edit', to: 'seasons#edit'

  get '/seasons/:id/storms', to: 'season_storms#index'

  get '/storms', to: 'storms#index'
  post '/storms', to: 'storms#create'
  get '/storms/new', to: 'storms#new'
  get '/storms/:id', to: 'storms#show'
end

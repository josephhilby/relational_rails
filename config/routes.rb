Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/seasons', to: 'seasons#index'
  post '/seasons', to: 'seasons#create'
  get '/seasons/new', to: 'seasons#new'
  get '/seasons/:id', to: 'seasons#show'

  get '/storms', to: 'storms#index'
end

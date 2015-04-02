Rails.application.routes.draw do

  root 'todo#index'

  resources :todo


end

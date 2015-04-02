Rails.application.routes.draw do

  root 'todos#index'

  resources :todos

  get 'todos/:id/move_placement' => 'todos#move_placement', as: :move

end

DogPark::Application.routes.draw do

  root 'dogowners#index'
  resources :dogowners, only: [:index, :show,:new, :create]
  resources :dogs, only:[:index, :show,:new, :create]
end

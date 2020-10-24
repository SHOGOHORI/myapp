Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  get  '/signup',  to: 'users#new'
  get  'users/:id/tab1', to:'users#show'
  get  'users/:id/tab2', to:'users#show_tab2' 
  resources :account_activations, only: :edit
  resources :questions
  resources :answers,          only: %i(create destroy)
  resources :sessions, only: %i(new create destory)
  get  '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'

  post '/guest', to: 'guest_sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

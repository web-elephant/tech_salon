Rails.application.routes.draw do
  namespace :cliant do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
  end

  namespace :user do
    root 'top#index'
  end

  root 'errors#routing_error'
  get '*anything' => 'errors#routing_error'
end

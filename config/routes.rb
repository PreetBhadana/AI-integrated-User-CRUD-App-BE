Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Your existing API namespace
  namespace :api do
    namespace :v1 do
      resources :users
      post 'chat', to: 'chat#ask'
    end
  end
end

Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :jobs, only: [:index, :show, :edit, :update, :new, :create] do
    resources :reviews, only: [:create]
    resources :volunteers, only: [:new, :create, :destroy]
  end
  get '/search', to: 'jobs#search'
  get 'dashboard/index'

  devise_for :users,
  controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'jobs#index'
end

Rails.application.routes.draw do
  resources :jobs, only: [:index, :show, :edit, :update, :new, :create]
  get 'dashboard/index'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'jobs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

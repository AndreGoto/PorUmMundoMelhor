Rails.application.routes.draw do
  get 'dashboard/index'

  get 'jobs/index'

  get 'jobs/show'

  get 'jobs/new'

  get 'jobs/create'

  get 'jobs/edit'

  get 'jobs/update'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

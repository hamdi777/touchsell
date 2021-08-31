Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'organizations#index'

  resources :organizations do
    resources :nodes
  end
end

Rails.application.routes.draw do
  root to: 'widgets#index'
  resources :widgets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

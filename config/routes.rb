Rails.application.routes.draw do
  get 'page/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "page#index"
  devise_for :users
  resources :foods do
    resources :activities
  end
end

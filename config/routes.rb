Rails.application.routes.draw do
  root 'home#index' #убираем root по умолчанию
  devise_for :users
  resources :users
  resources :posts
  get 'posts/page/(:page(.:format))', to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

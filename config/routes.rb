Rails.application.routes.draw do
  resources :posts
  get 'posts/page/(:page(.:format))', to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

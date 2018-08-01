Rails.application.routes.draw do
  namespace :admin do
    get 'discs/new'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :products, only: [:show, :index]
resources :carts, only: [:show, :update] do
  get '/confirm' => 'carts#confirm',as: 'confirm'
end
resources :orders, only: [:show]
resources :users, only: [:show, :edit, :update]
resources :receivers, only: [:new, :create]
resources :artists, only: [:show, :index]
resources :genres, only: [:show]

namespace :admin do
  resources :artists
end

namespace :admin do
  resources :genres
end

namespace :admin do
  resources :labels
end


namespace :admin do
  resources :products do
  	resources :discs do
      resources :songs
    end
  end
end
root :to => 'products#index'
get 'tops/top', as: 'top'
post 'products/cart' => 'products#cart', as: 'cart_product'
delete 'products/cart' => 'products#cart_destroy', as: 'destroy_cart_product'
post 'products/purcahse' => 'products#purchase', as: 'purchase'
get 'search', to: 'products#search'
end

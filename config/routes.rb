Rails.application.routes.draw do
  
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
  resources :genres
  resources :labels
  resources :orders, only: [:index, :show, :update]
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
delete 'admin/products/:id/edit' => 'admin/products#product_destroy', as: 'destroy_product_product'

end

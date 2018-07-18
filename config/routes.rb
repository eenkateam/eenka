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
resources :carts


namespace :admin do
  resources :products do
  	resources :discs
  end
end
root :to => 'products#index'
get 'tops/top', as: 'top'
end

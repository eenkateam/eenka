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
namespace :admin do
  resources :products, only: [:create, :destroy, :update, :edit, :new]
end
root :to => 'products#index'
get 'tops/top', as: 'top'
end

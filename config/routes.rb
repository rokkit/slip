Slip::Application.routes.draw do
  resources :facet_values

  resources :facets

  resources :products do
  end
  

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
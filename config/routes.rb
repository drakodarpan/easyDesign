Rails.application.routes.draw do

  resources :attachments

  resources :posts

  devise_for :usuarios, :controllers => {omniauth_callbacks:  "omniauth_callbacks"}
  get 'welcome/index'
  root :to => 'welcome#index'

end

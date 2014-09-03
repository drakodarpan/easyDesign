Rails.application.routes.draw do

  devise_for :usuarios, :controllers => {omniauth_callbacks:  "omniauth_callbacks"}
  get 'welcome/index'
  root :to => 'welcome#index'

end

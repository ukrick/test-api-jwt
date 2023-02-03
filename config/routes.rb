Rails.application.routes.draw do

  devise_for :users

  namespace :system do
    get 'dashboard', to: 'dashboard#index'
  end

  root 'welcome#index'
end

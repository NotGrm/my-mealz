Rails.application.routes.draw do
  resources :meals, except: :destroy

  root 'meals#index'
end

Rails.application.routes.draw do
  root 'static_pages#index'
  
  resources :dashboards, except: :show

  get '/deal', to: 'static_pages#deal'
  get '/departments/:id', to: 'departments#show', as: 'department'

  mount ActionCable.server => '/cable'
end

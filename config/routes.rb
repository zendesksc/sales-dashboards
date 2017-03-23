Rails.application.routes.draw do
  root 'static_pages#index'
  resources :dashboards, except: :show
  get '/departments/:id', to: 'departments#show', as: 'department'
end

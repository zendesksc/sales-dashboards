Rails.application.routes.draw do
  resources :dashboards, except: :show
  get '/departments/:id', to: 'departments#show', as: 'department'
end

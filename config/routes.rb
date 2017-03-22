Rails.application.routes.draw do
  resources :dashboards, except: :show
end

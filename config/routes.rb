Rails.application.routes.draw do
  namespace :app do
    namespace :api do
      resources :ais
    end
  end
end

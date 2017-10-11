# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'localhost'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :calendar, only: %i[index show create update destroy]
      resources :user, only: %i[index show create update destroy]
    end
  end
end

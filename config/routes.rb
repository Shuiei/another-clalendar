# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'localhost'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :users

      resource :user do
        resources :calendars do
          resources :events
          resource :leave_calendars, only: [:destroy], path: :leave
        end

        # resources :groups do
        #   resources :contact_groups, path: 'contact', only: [:create]
        # end

        resources :contacts, only: %i[index show create destroy]
      end
    end
  end
end

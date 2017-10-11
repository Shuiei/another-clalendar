# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_current_user

      def index
        @user = current_user
        render_ressource_success
      end

      def show
        @user = User.find(params[:id])

        if @user
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def update
        if current_user.update(user_params)
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def destroy
        if current_user.destroy
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      private

      def user_params
        params.permit(:name, :nickname, :image)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @user,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   @user.errors,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

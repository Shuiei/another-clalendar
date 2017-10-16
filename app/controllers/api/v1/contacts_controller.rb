# frozen_string_literal: true

module Api
  module V1
    class ContactController < ApplicationController
      before_action :authenticate_current_user!

      def index
        @contact = current_user.contacts
        render_ressource_success
      end

      def show
        @contact = current_user.contacts.find(params[:id])

        if @contact
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def update
        @contact = current_user.contacts.find(params[:id])

        if @contact.update(contact_params)
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def create
        @contact = current_user.contacts.build(contact_params)

        if @contact.save
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def destroy
        @contact = current_user.contacts.find(params[:id])

        if @contact.destroy
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      private

      def contact_params
        params.permit(:id, :title, :private)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @contact,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   @contact.errors,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

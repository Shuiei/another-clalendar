
module Api
  module V1
    class ContactGroupsController < ApplicationController
      before_action :authenticate_current_user!

      def create
        @group = current_user.groups.find(params[:id])
        @contact = current_user.contacts.find(group_params[:contact_id])
        @contact.groups << @group

        render_ressource_success
      end

      private

      def group_params
        params.permit(:contact_id)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @contact.groups.last,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   'just error, désolé pas d\'infos super pour le moment :/',
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

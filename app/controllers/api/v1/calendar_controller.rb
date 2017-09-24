
module Api
  module V1
    class CalendarController < ApplicationController
      before_action :authenticate_user!

      def show
        @resource = current_user.calendars.find(params[:id])

        if @resource
          render_create_ressource(@resources)
        else
          render_create_errors(@resources.errors)
        end
      end

      def create
        raise calendar_params.inspect
        @resource = current_user.calendars.build(calendar_params)

        if @resource.save
          render_create_ressource
        else
          render_create_errors
        end
      end

      private

      def calendar_params
        params.permit(:title, :private)
      end

      def render_create_ressource
        render json: {
          status: 'success',
          data:   @resource.errors,
          errors: [I18n.t("devise_token_auth.registrations.missing_confirm_success_url")]
        }, status: 422
      end

      def render_create_errors
        render json: {
          status: 'error',
          data:   @resource.errors,
          errors: [I18n.t("devise_token_auth.registrations.missing_confirm_success_url")]
        }, status: 422
      end
    end
  end
end

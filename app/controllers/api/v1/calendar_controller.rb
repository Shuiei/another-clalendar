
module Api
  module V1
    class CalendarController < ApplicationController
      before_action :authenticate_api_v1_user!

      def show
        current_user.calendar.find(params[:id])
      end

      def create
        calendar = current_user.calendar.build(calendar_params)
        if calendar.save
          render_create_ressource(calendar)
        else
          render_create_errors(calendar.errors)
        end
      end

      private

      def calendar_params
        params.require(:calendar).permit(:title, :private)
      end

      def render_create_ressource(resource_data)
        render json: {
          status: 'success',
          data:   resource_data.to_json,
          errors: [I18n.t("devise_token_auth.registrations.missing_confirm_success_url")]
        }, status: 422
      end

      def render_create_errors(errors)
        render json: {
          status: 'error',
          data:   errors.to_json,
          errors: [I18n.t("devise_token_auth.registrations.missing_confirm_success_url")]
        }, status: 422
      end
    end
  end
end

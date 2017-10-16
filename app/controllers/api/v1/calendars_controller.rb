# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      before_action :authenticate_current_user!

      def index
        @calendar = current_user.calendars
        render_ressource_success
      end

      def show
        @calendar = current_user.calendars.find(params[:id])

        if @calendar
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def update
        @calendar = current_user.calendars.find(params[:id])

        if @calendar.update(calendar_params)
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def create
        @calendar = current_user.calendars.build(calendar_params)

        if @calendar.save
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def destroy
        @calendar = current_user.calendars.find(params[:id])

        if @calendar.destroy
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      private

      def calendar_params
        params.permit(:title, :private)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @calendar,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   @calendar.errors,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

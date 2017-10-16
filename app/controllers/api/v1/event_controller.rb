# frozen_string_literal: true

module Api
  module V1
    class EventController < ApplicationController
      before_action :authenticate_current_user!

      def index
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events

        render_ressource_success
      end

      def show
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def update
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event.update(event_params)
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def create
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events.build(params[:id])

        if @event.save
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def destroy
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event.destroy
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      private

      def event_params
        params.permit(:calendar_id, :title, :private, :description)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @event,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   @event.errors,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

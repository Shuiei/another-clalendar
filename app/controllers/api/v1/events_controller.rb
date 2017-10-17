# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      before_action :authenticate_user!

      def index
        @calendar = current_user.calendar.find(event_params[:calendar_id])
        @event = @calendar.events

        render json: @event
      end

      def show
        @calendar = current_user.calendar.find(params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event
          render json: @event
        else
          render json: @event.errors
        end
      end

      def update
        @calendar = current_user.calendar.find(params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event.update(event_params)
          return render json: @event
        else
          return render json: @event.errors
        end
      end

      def create
        @calendar = current_user.calendar.find(params[:calendar_id])
        @event = @calendar.events.build(params[:id])

        if @event.save
          return render json: @event
        else
          return render json: @event.errors
        end
      end

      def destroy
        @calendar = current_user.calendar.find(params[:calendar_id])
        @event = @calendar.events.find(params[:id])

        if @event.destroy
          render json: @event
        else
          render json: @event.errors
        end
      end

      private

      def event_params
        params.permit(:title, :description, :start_at, :end_at)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      before_action :authenticate_user!

      def index
        @calendar = Calendar.for_invited_user(current_user).find(params[:calendar_id])
        @event = @calendar.events

        render json: @event
      end

      def create
        @calendar = current_user.calendar.find(params[:calendar_id])
        @event = @calendar.events.build(event_params)

        if @event.save
          return render json: @event
        else
          return render json: @event.errors
        end
      end

      def show
        @calendar = Calendar.for_invited_user(current_user).find(params[:calendar_id])
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
        params.require(:event).permit(:title, :description, :start_at, :end_at, :important,
                                      participants_attributes: [:id, :participant_id])
      end
    end
  end
end

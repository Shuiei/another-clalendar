# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      before_action :authenticate_user!

      def index
        @calendar = current_user_calendars

        render json: @calendar
      end

      def show
        @calendar = current_user_calendars.find(params[:id])

        if @calendar
          render json: @calendar
        else
          render json: @calendar.errors
        end
      end

      def update
        @calendar = current_user.calendars.find(params[:id])

        if @calendar.update(calendar_params)
          return render json: @calendar
        else
          return render json: @calendar.errors
        end
      end

      def create
        @calendar = current_user.calendars.build(calendar_params)

        if @calendar.save
          return render json: @calendar
        else
          return render json: @calendar.errors
        end
      end

      def destroy
        @calendar = current_user.calendars.find(params[:id])

        if @calendar.destroy
          render json: @calendar
        else
          render json: @calendar.errors
        end
      end

      private

      def calendar_params
        params.require(:calendar).permit(:title, :private, :primary,
                                         participants_attributes: [:id, :participant_id],
                                         events_attributes: [
                                           :id, :title, :description,
                                           :start_at, :end_at
                                         ])
      end

      def current_user_calendars
        calendar = current_user.calendars
        calendar << Calendar.for_invited_user(current_user)

        calendar.distinct
      end
    end
  end
end

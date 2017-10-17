# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      before_action :authenticate_current_user!

      def index
        @calendar = current_user.calendars
        render json: @calendar
      end

      def show
        @calendar = current_user.calendars.find(params[:id])

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
        params.permit(:title, :private)
      end
    end
  end
end

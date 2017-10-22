# frozen_string_literal: true

module Api
  module V1
    class LeaveCalendarsController < ApplicationController
      before_action :authenticate_user!

      def destroy
        contact = Contact.find_by(user: current_user)
        calendar = Calendar.find(params[:calendar_id])
        @calendar_participant = calendar.calendar_participants.find_by(participant: contact)

        if @calendar_participant.destroy
          render json: @calendar_participant
        else
          render json: @calendar_participant.errors
        end
      end
    end
  end
end

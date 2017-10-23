# frozen_string_literal: true

module Api
  module V1
    class LeaveEventsController < ApplicationController
      before_action :authenticate_user!

      def destroy
        contact = Contact.find_by(user: current_user)
        calendar = Calendar.find(params[:calendar_id])
        event = calendar.events.find(params[:event_id])

        @event_participant = event.event_participants.find_by(participant: contact)

        if @event_participant.destroy
          render json: @event_participant
        else
          render json: @event_participant.errors
        end
      end
    end
  end
end

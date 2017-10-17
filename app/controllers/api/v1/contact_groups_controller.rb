# frozen_string_literal: true

module Api
  module V1
    class ContactGroupsController < ApplicationController
      before_action :authenticate_current_user!

      def create
        @group = current_user.groups.find(params[:group_id])
        @contact = current_user.contacts.find(group_params[:contact_id])
        @contact.groups << @group

        @contact.groups.last
      end

      private

      def group_params
        params.permit(:contact_id)
      end
    end
  end
end

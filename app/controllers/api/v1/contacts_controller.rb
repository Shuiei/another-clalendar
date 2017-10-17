# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      before_action :authenticate_user!

      def index
        @contact = current_user.contacts
        render json: @contact
      end

      def show
        @contact = current_user.contacts.find(params[:id])

        render json: @contact
      end

      def create
        define_create_attributes
        @contact = current_user.contacts.build(contact_params)

        if @contact.save
          render json: @contact
        else
          render(json: @contact.errors)
        end
      end

      def destroy
        @contact = current_user.contacts.find(params[:id])

        if @contact.destroy
          render json: @contact
        else
          render json: @contact.errors
        end
      end

      private

      def contact_params
        params.permit(:user_id)
      end

      def define_create_attributes
        return if params[:email].blank?

        params[:user_id] = User.find_by(email: params[:email]).id
        params.delete(:email)
      end
    end
  end
end

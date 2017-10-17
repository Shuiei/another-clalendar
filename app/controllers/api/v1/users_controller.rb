# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_current_user

      def index
        @user = current_user
        render json: @user
      end

      def show
        @user = User.find(params[:id])

        if @user
          render json: @user
        else
          render json: @user.errors
        end
      end

      def update
        if current_user.update(user_params)
          render json: @user
        else
          render json: @user.errors
        end
      end

      def destroy
        if current_user.destroy
          render json: @user
        else
          render json: @user.errors
        end
      end

      private

      def user_params
        params.permit(:name, :nickname, :image)
      end
    end
  end
end

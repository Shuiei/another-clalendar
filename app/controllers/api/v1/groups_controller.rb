# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_user!

      def index
        @group = current_user.groups
        render json: @group
      end

      def show
        @group = current_user.groups.find(params[:id])

        if @group
          render json: @group
        else
          render json: @group.errors
        end
      end

      def update
        @group = current_user.groups.find(params[:id])

        if @group.update(group_params)
          return render json: @group
        else
          return render json: @group.errors
        end
      end

      def create
        @group = current_user.groups.build(group_params)

        if @group.save
          return render json: @group
        else
          return render json: @group.errors
        end
      end

      def destroy
        @group = current_user.groups.find(params[:id])

        if @group.destroy
          render json: @group
        else
          render json: @group.errors
        end
      end

      private

      def group_params
        params.permit(:title)
      end
    end
  end
end

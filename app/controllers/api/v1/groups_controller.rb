# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_current_user!

      def index
        @group = current_user.groups
        render_ressource_success
      end

      def show
        @group = current_user.groups.find(params[:id])

        if @group
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      def update
        @group = current_user.groups.find(params[:id])

        if @group.update(group_params)
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def create
        @group = current_user.groups.build(group_params)

        if @group.save
          return render_ressource_success
        else
          return render_ressource_errors
        end
      end

      def destroy
        @group = current_user.groups.find(params[:id])

        if @group.destroy
          render_ressource_success
        else
          render_ressource_errors
        end
      end

      private

      def group_params
        params.permit(:title)
      end

      def render_ressource_success
        render json: {
          status: 'success',
          data:   @group,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 200
      end

      def render_ressource_errors
        render json: {
          status: 'error',
          data:   @group.errors,
          errors: [I18n.t('devise_token_auth.registrations.missing_confirm_success_url')]
        }, status: 422
      end
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken

  def current_user
    current_api_v1_user
  end

  def authenticate_user!
    authenticate_api_v1_user!
  end

  # def authenticate_current_user!
  #   return unless get_current_user.nil?

  #   render json: {
  #     status: 'error',
  #     errors: ['Unautorized']
  #   }, status: 402
  # end

  # attr_reader :current_user

  # def get_current_user
  #   return nil if request.headers['access-token'].blank?

  #   token = request.headers['access-token']
  #   client = request.headers['client']
  #   expiry = request.headers['expiry']
  #   uid = request.headers['uid']

  #   expiration_datetime = DateTime.strptime(expiry, '%s')
  #   current_user = User.find_by(uid: uid)

  #   if current_user&.tokens&.key?(client) &&
  #      expiration_datetime > DateTime.now

  #     @current_user = current_user
  #   end

  #   @current_user
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name nickname image])
  end
end

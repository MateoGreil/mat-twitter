
class ApplicationController < ActionController::Base

  def authenticate
    authenticate_or_request_with_http_basic('Authentification') do |username, password|
      User.where(username: username, password: password).exists?
      session[:current_user_id] = User.where(username: username, password: password).first.id
    end
  end
end

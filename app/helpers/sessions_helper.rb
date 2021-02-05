# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:current_user_id] = user.id
  end

  def current_user
    @current_user ||= Member.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def role_check
    current_user = Member.find_by(id: session[:current_user_id])
    current_user.role_id
  end

  def log_out
    session.delete(:current_user_id)
    @current_user = nil
  end
end

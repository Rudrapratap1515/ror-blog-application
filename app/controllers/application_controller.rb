# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authentication
  include SessionsHelper

  def authentication
    @member = Member.new
    if session[:token] && session[:current_user_id]
      @member = Member.find_by(id: session[:current_user_id])
      redirect_to sessions_new_path if session[:token] != @member.token
    else
      redirect_to sessions_new_path
    end
  end
end

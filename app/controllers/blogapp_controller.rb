# frozen_string_literal: true

class BlogappController < ApplicationController
  def index
    redirect_to sessions_new_path unless logged_in?
  end
end

class BlogappController < ApplicationController
  def index
    if !logged_in?
      redirect_to sessions_new_path
    end
  end
end

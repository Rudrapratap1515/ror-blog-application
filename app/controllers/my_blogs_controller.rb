# frozen_string_literal: true

class MyBlogsController < ApplicationController
  def index
    @my_blogs = Blog.where(member_id: session[:current_user_id])
  end
end

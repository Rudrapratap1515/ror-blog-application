# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  # before_action :authentication

  # GET /blogs
  # GET /blogs.json
  def index
    redirect_to sessions_new_path unless logged_in?
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show; end

  # GET /blogs/new
  def new
    if role_check == 1 || role_check == 2
      @blog = Blog.new
    else
      redirect_to blogs_path
    end
  end

  # GET /blogs/1/edit
  def edit
    if role_check == 1 || role_check == 2
      current_user = Member.find_by(id: session[:current_user_id])
      if role_check == 2 && Blog.find(params[:id]).member_id == current_user.id

      elsif role_check == 1

      else
        redirect_to blogs_path
      end
    else
      redirect_to blogs_path
    end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :read_time, :image, :body, :category_id, :member_id)
  end
end

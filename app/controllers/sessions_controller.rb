class SessionsController < ApplicationController
  skip_before_action :authentication

  def new
    if !logged_in?
      @member = Member.new
    else
      redirect_to blogs_path
    end
  end

  def create
    @member = Member.find_by(email: params[:session][:email].downcase)
    if @member[:password] == params[:session][:password]
      log_in @member
      #redirect_to @member
      randomString = SecureRandom.hex
      @member.token = randomString
      @member.save
      response.headers["X-AUTH-TOKEN"] = randomString
      session[:token] = response.headers["X-AUTH-TOKEN"]
      redirect_to blogs_path
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to sessions_new_path
  end
end

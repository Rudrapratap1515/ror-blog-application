class ApplicationController < ActionController::Base
    before_action :authentication 
    include SessionsHelper

    def authentication
        @member = Member.new 
        if session[:token]
            if session[:current_user_id]
                @member = Member.find_by(id: session[:current_user_id])
                if session[:token] != @member.token
                    redirect_to sessions_new_path
                end
            end
        else
            redirect_to sessions_new_path
        end
    end
end

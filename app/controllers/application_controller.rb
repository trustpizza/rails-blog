class ApplicationController < ActionController::Base
    
    private

    def authenticate_admin!
      unless current_user && current_user.admin?
        redirect_to new_user_session_path
      end
    end
end

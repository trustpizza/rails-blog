class ApplicationController < ActionController::Base
    
    private

    def authenticate_admin!
      unless current_user && current_user.admin?
        redirect_to new_user_session_path
      end
    end

    def authenticate_author!
      roles = ["owner", "author", "admin"]
      unless current_user && roles.include?(current_user.role)
        redirect_to new_user_session_path
      end
    end
end

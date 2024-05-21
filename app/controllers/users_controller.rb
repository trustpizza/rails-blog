class UsersController < ApplicationController
    before_action :authenticate_admin!
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to users_path, notice: 'User role was successfully updated.'
        else
          redirect_to users_path, alert: 'There was an error updating the user role.'
        end
      end
    
    private

    def user_params
    params.require(:user).permit(:role)
    end
end

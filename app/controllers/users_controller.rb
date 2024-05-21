class UsersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_user

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_path, notice: 'User role was successfully updated.'
        else
          redirect_to root_url, alert: 'There was an error updating the user role.'
        end
      end
    
    def destroy
      @user.destroy!

      respond_to do |format|
        format.html { redirect_to admin_path, notice: "User was delete." }
        format.json { head :no_content }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:role, :id)
    end
end

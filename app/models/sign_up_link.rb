class SignUpLink < ApplicationRecord
    def new
        @signup_link = SignUpLink.find_by(token: params[:token])
        if @signup_link && @signup_link.valid?
            @author = Author.new
        else
            redirect_to root_path, notice: 'Invalid Sign Up Link'
        end
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            # Handle successful signup? Probably an email
        else
            render :new
        end
    end

    private
    
    def author_params
        params.require(:author).permit(:email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
    def new
    end
  
    def create
        user = User.find_by(email: params[:user][:email].downcase)
        if user
            flash.now[:danger] = 'Email has already been taken'
            render('new')
        elsif params[:user][:password].length<8
            flash.now[:danger] = 'Password is too short (minimum is 8 characters)'
            render('new')
        elsif params[:user][:password]!=params[:user][:password]
            flash.now[:danger] = "Password confirmation doesn't match Password"
            render('new')
        else
            user = User.new(name: params[:user][:name], email: params[:user][:email].downcase, password: params[:user][:password])
            
            if user.save
                profile = Profile.new(name: user.name, user_id: user.id)
                if profile.save
                    log_in(user)
                    redirect_to(edit_url)
                else
                    log_out(user)
                    user.destroy
                    flash.now[:danger] = 'Error in creating profile.'
                    render('new')
                end
            else
                flash.now[:danger] = 'Error in creating user.'
                render('new')
            end
        end
    end
  
    def destroy
        log_out
        redirect_to(root_url)
    end
end

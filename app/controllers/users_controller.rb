class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = 'Thank you for signing up!'
        redirect_to root_path
      else
        flash[:error] = @user.errors.full_messages
        redirect_to signup_path
      end
  end

private

  def user_params
    # { email: 'someemail@email.com', password: 'password', 'password_confirmation: 'password' }
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation
                                 )
  end
end

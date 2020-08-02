class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :username, :password))

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash.now[:messages] = @user.errors.full_messages[0]
      render :new
    end
    
  end
end

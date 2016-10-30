class UsersController < ApplicationController

  before_action :require_logout 

	def new 
		@user = User.new 
	end 

	 def create 
    @user = User.new(user_params)
    if @user.save 
      NewUserMailer.welcome_user(@user).deliver 
      session[:user_id] = @user.id 
      flash[:notice] = 'Successfully signed up' 
      redirect_to '/', notice: "Signed up successfully!"
    else 
      redirect_to '/signup'
    end 
  end
  
  private 
  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password) 
  end 

end

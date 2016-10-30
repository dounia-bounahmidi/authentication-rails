class NewUserMailer < ApplicationMailer

	def welcome_user(user)
		@user = user 
		mail(to: @user.email, subject: "Welcome to ListUp") 
	end 

end

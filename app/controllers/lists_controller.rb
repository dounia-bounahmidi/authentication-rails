class ListsController < ApplicationController

    before_action :require_login 

	def index 
        @list = current_user.lists.build 
        @lists = List.where(:user_id => current_user.id).order(created_at: :desc).all 
	end 

    def show
        @list = List.find(params[:id])
        @task = @list.tasks 
        unless session[:user_id] == @list.user_id
            redirect_to '/dashboard'
       end 
    end

    def create 
    	@list = current_user.lists.build(list_params)    	
      	if @list.save 
    		redirect_to '/dashboard'
    	else 
    		render 'new'
    	end 
    end

    def destroy 
    	@list = List.find(params[:id])
    	@list.destroy
    	redirect_to '/dashboard'
    end 

    private 
    def list_params 
    	params.require(:list).permit(:title)
    end 

end

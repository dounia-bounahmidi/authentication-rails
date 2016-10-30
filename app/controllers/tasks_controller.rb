class TasksController < ApplicationController

	 before_action :require_login  

	def create 
		@list = List.where(:user_id => current_user.id).find(params[:list_id])
		@task = @list.tasks.create(task_params)
		redirect_to list_path(@list) 
	end 

	def destroy 
		@list = List.where(:user_id => current_user.id).find(params[:list_id])
		@task = @list.tasks.find(params[:id])
    	@task.destroy
    	redirect_to list_path(@list)
    end 

    def complete 
    	@list = List.where(:user_id => current_user.id).find(params[:list_id])
    	@task = @list.tasks.find(params[:id])
    	@task.update_attribute(:completed_at, Time.now)
    	redirect_to list_path(@list)
    end 

	private 
	def task_params 
		params.require(:task).permit(:description)
	end 

end


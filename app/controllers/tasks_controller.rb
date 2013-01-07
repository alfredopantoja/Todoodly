class TasksController < ApplicationController

	def create 
		@list = List.find(params[:list_id])
		@task = @list.tasks.new(params[:task])
		if @task.save
			flash[:notice] = "Task created"
			redirect_to list_url(@list)
		else
			flash[:error] = "Could not add task at this time."
			redirect_to list_url(@list)
		end
	end

	def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		redirect_to list_url(@list)
	end

end

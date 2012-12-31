class ListsController < ApplicationController

	def index
		@lists = List.all
	end
	
	def new
		@list = List.new
	end

	def create 
		@list = List.new(params[:list])
		if @list.save
			flash[:notice] = "List created."
			redirect_to list_url(@list)
		else
			flash[:error] = "Could not create list"
			redirect_to new_list_url
		end
	end

	def show
		@list = List.find(params[:id])
	end
	
end

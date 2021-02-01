class TodoItemsController < ApplicationController
	before_action :set_todo_list

	def create 
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list
	end

	def destroy
		deleted = @todo_list.todo_items.find(params[:id]).destroy
		if deleted 
			flash[:success] = "Todo item deleted successfully!"
		else
			flash[:error] = 'Todo item could not be deleted!'
		end
		redirect_to @todo_list
	end

	private
	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params 
		params[:todo_item].permit(:content)
	end
end

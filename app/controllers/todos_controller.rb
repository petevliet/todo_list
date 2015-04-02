class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todos = Todo.all
    @todo = Todo.new(todo_params)
    @todo.position = @todos.count + 1
    if @todo.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update

  end

  def destroy

  end

  private
  def todo_params
    params.require(:todo).permit(:position, :description, :completed)
  end

end

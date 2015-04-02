class TodosController < ApplicationController

  def index
    @todos = Todo.all.sort_by(&:position)
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

  def move_placement
    @todo = Todo.find(params[:id])

    current_placement = @todo.position
    other_placement = current_placement + params[:direction].to_i
    other_todo = Todo.find_by(position: other_placement)

    other_todo.update(position: other_placement - params[:direction].to_i)
    @todo.update(position: other_placement)

    redirect_to root_path
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

class CreateTodo < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :position
      t.string :description
      t.boolean :completed
    end
  end
end

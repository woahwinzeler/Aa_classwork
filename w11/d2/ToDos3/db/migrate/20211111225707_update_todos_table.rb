class UpdateTodosTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :body, :string
    add_column :todos, :body, :string, null: false
  end
end

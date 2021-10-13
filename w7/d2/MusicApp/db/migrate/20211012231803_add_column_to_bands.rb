class AddColumnToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :city, :string
  end
end

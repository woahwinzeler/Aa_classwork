class AddLocationToBands < ActiveRecord::Migration[5.2]
  def change
   remove_column :bands, :city, :string
   add_column :bands, :location, :string
  end
end

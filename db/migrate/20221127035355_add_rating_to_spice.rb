class AddRatingToSpice < ActiveRecord::Migration[6.1]
  def change
    add_column :spices, :rating, :float
  end
end

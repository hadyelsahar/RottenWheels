class AddPriceToCars < ActiveRecord::Migration
  def change
    add_column :cars, :price, :integer_
  end
end

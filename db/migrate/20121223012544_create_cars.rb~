class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :mark
      t.string :model
      t.string :thumbnailurl
      t.url :picture
      t.text :comment
      t.integer :cc
      t.integer :kmpassed
      t.boolean :automatic
      t.boolean :centerlock
      t.boolean :powersteering
      t.boolean :abs
      t.boolean :electricwindow
      t.boolean :airbag

      t.timestamps
    end
  end
end

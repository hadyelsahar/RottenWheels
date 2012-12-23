class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :mobile
      t.string :location
      t.string :pricture
      t.string :thumbnail
      t.string :authority

      t.timestamps
    end
  end
end

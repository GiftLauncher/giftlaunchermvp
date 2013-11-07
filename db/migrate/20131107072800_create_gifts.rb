class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :description, :limit => 1000
      t.float :price
      t.timestamps
    end
  end
end

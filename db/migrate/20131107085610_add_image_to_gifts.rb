class AddImageToGifts < ActiveRecord::Migration
  def up
    add_attachment :gifts, :image
  end

  def down
    remove_attachment :gifts, :image
  end
end

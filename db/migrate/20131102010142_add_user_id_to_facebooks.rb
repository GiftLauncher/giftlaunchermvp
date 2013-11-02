class AddUserIdToFacebooks < ActiveRecord::Migration
  def change
    add_column :facebooks, :user_id, :integer, :after => :id
  end
end

class RemovePrototypeUserFromLike < ActiveRecord::Migration
  def change
    remove_reference :likes, :prototype
    remove_reference :likes, :user
  end
end

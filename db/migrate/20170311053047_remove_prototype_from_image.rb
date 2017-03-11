class RemovePrototypeFromImage < ActiveRecord::Migration
  def change
    remove_reference :images, :prototype, index: true
  end
end

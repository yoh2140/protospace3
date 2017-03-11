class AddPrototypeFromImage < ActiveRecord::Migration
  def change
    add_reference :images, :prototype, index: true, foreign_key: true
  end
end

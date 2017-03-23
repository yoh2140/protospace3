class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :protottype
      t.references :user

      t.timestamps null: false
    end
  end
end

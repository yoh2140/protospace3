class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string     :title
      t.text       :cach_copy
      t.text       :concept
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end

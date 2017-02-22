class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text       :image
      t.text       :status
      t.references :prototype, foreign_key: true

      t.timestamps null: false
    end
  end
end

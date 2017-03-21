class RenameProtottypeIdColumnToLikes < ActiveRecord::Migration
  def change
    rename_column :likes, :protottype_id, :prototype_id
  end
end

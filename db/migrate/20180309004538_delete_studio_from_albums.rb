class DeleteStudioFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :studio
    change_column :albums, :live, :boolean, null: false
  end
end

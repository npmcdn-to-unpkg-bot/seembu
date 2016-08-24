class RemoveRoomFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :room
    add_column :profiles, :firmname, :string
  end

  def down
    add_column :projects, :room, :string
    remove_column :profiles, :firmname
  end
end

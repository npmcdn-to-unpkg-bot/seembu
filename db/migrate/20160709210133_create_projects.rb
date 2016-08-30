class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :location
      t.string :style
      t.string :size
      t.text :description

      t.timestamps null: false
    end
  end
end

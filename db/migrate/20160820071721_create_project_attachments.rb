class CreateProjectAttachments < ActiveRecord::Migration
  def change
    create_table :project_attachments do |t|
      t.integer :project_id
      t.string :picture

      t.timestamps null: false
    end
  end
end

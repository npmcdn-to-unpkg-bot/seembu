class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_type, :string
    add_column :projects, :year_finished, :integer
  end
end

class AddFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :service_provided, :string
    add_column :profiles, :areas_served, :string
    add_column :profiles, :license_no, :string
    add_column :profiles, :awards, :string
  end
end

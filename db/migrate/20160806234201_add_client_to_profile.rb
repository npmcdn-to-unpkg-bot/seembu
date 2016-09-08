class AddClientToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :sex, :string
    add_column :profiles, :birthdate, :date
    add_column :profiles, :fbacc, :string
    add_column :profiles, :twacc, :string
    add_column :profiles, :website, :string
  end
end

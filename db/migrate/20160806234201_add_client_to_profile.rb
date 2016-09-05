class AddClientToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :sex, :string
    add_column :profiles, :birthdate, :date
    add_column :profiles, :occupation, :string
    add_column :profiles, :fbacc, :string
    add_column :profiles, :twacc, :string
    add_column :profiles, :website, :string
    add_column :profiles, :username, :string
    add_column :profiles, :firmname, :string
  end
end

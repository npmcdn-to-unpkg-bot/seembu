class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :contactno
      t.string :service
      t.text :description

      t.timestamps null: false
    end
  end
end

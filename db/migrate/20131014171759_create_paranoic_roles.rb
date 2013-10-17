class CreateParanoicRoles < ActiveRecord::Migration
  def change
    create_table :paranoic_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end

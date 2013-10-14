class CreateParanoicAttributePermissions < ActiveRecord::Migration
  def change
    create_table :paranoic_attribute_permissions do |t|
      t.string :class_name
      t.string :attribute_name
      t.integer :bin
      t.integer :role_id

      t.timestamps
    end
  end
end

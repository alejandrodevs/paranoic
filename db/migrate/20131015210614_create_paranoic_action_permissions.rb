class CreateParanoicActionPermissions < ActiveRecord::Migration
  def change
    create_table :paranoic_action_permissions do |t|
      t.string :class_name
      t.string :action
      t.integer :role_id

      t.timestamps
    end
  end
end

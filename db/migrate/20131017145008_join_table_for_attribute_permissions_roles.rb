class JoinTableForAttributePermissionsRoles < ActiveRecord::Migration
  def up
    create_table :attribute_permissions_roles, :id => false do |t|
      t.references :attribute_permission, :role
    end
  end

  def down
    drop_table :attribute_permissions_roles
  end
end

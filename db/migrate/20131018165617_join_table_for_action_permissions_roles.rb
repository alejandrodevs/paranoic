class JoinTableForActionPermissionsRoles < ActiveRecord::Migration
  def up
    create_table :action_permissions_roles, :id => false do |t|
      t.references :action_permission, :role
    end
  end

  def down
    drop_table :action_permissions_roles
  end
end

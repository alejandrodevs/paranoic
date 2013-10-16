class JoinTableForParanoicRoleAndUser < ActiveRecord::Migration
  def up
    create_table :paranoic_roles_users, :id => false do |t|
      t.references :paranoic_role, :user
    end

    add_index :paranoic_roles_users, [:role_id, :user_id]
  end

  def down
    drop_table :paranoic_roles_users
    remove_index :paranoic_roles_users, [:role_id, :user_id]
  end
end

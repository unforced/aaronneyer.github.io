class AddSecretKeyToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :secret_key, :string
  end
end

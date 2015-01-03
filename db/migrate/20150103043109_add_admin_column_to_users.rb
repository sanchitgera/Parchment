class AddAdminColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => 'editor'
  end
end

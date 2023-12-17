class AddUsers < ActiveRecord::Migration[6.1]
  def change
  #  create_table :users do |t|
  #     t.string :first_name
  #     t.string :last_name
  #     t.string :email
  #     t.string :password_digest
  
      # Remove existing 'name' and 'password' columns
      remove_column :users, :name
      remove_column :users, :password
  
      # Add 'first_name', 'last_name', and 'password_digest' columns
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :password_digest, :string

  end
end

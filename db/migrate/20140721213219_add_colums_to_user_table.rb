class AddColumsToUserTable < ActiveRecord::Migration
  def change
  	add_column :user, :name, :string
  	add_column :user, :email, :string
  	add_column :user, :password_digest, :string 
  end
end

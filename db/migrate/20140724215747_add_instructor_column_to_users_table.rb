class AddInstructorColumnToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :instructor, :boolean
  end
end

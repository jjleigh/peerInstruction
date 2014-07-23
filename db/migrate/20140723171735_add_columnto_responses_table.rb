class AddColumntoResponsesTable < ActiveRecord::Migration
  def change
  	add_column :responses, :user_id, :integer
  	add_column :responses, :answer_choice_id, :integer
  end
end

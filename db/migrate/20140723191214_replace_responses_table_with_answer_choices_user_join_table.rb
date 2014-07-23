class ReplaceResponsesTableWithAnswerChoicesUserJoinTable < ActiveRecord::Migration
  def change
  	drop_table :responses
  	create_join_table :answer_choices, :users
  end
end

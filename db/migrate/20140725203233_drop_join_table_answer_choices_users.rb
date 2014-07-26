class DropJoinTableAnswerChoicesUsers < ActiveRecord::Migration
  def change
  	drop_join_table :answer_choices, :users
  end
end

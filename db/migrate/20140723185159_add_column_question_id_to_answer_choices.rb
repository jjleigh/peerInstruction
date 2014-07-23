class AddColumnQuestionIdToAnswerChoices < ActiveRecord::Migration
  def change
  	add_column :answer_choices, :question_id, :integer
  end
end

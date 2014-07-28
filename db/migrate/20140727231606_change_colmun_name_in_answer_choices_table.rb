class ChangeColmunNameInAnswerChoicesTable < ActiveRecord::Migration
  def change
  	rename_column :answer_choices, :answer_choice, :description
  end
end

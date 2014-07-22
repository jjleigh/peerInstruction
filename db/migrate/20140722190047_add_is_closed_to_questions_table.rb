class AddIsClosedToQuestionsTable < ActiveRecord::Migration
  def change
  	add_column :questions, :is_open, :boolean, :default => true
  end
end

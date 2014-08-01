class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
    end

    create_table :responses do |t|
      t.timestamps
    end

  end
end

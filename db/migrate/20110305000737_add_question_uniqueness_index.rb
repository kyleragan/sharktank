class AddQuestionUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :problems, :question, :unique => true
  end

  def self.down
    remove_index :problems, :question
  end
end

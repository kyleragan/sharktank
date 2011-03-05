class RemoveAnswerFromProblem < ActiveRecord::Migration
  def self.up
    remove_column :problems, :answer
  end

  def self.down
    add_column :problems, :answer, :string
  end
end

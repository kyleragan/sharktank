class AddProblemcontentindexToAnswers < ActiveRecord::Migration
  def self.up
    add_index :answers, [ :problem_id, :content ], :unique => true
  end

  def self.down
    remove_index :answers, [ :problem_id, :content ]
  end
end

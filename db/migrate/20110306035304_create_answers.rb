class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :content
      t.integer :problem_id
      t.boolean :correct

      t.timestamps
    end
    add_index :answers, :problem_id
  end

  def self.down
    drop_table :answers
  end
end

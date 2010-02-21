class AddTypeToProblems < ActiveRecord::Migration
  def self.up
    add_column :problems, :type, :string
  end

  def self.down
    remove_column :problems, :type
  end
end

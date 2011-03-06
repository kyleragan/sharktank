class Answer < ActiveRecord::Base
  attr_accessible :content, :correct
  
  belongs_to :problem
  
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates :problem_id, :presence => true
  validates_inclusion_of :correct, :in => [ true, false ]
end


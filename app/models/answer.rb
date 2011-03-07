


class Answer < ActiveRecord::Base
  attr_accessible :content, :correct
  
  belongs_to :problem
  
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates :problem_id, :presence => true
  validates_inclusion_of :correct, :in => [ true, false ]
  validates_uniqueness_of :content, :scope => :problem_id
  validates_uniqueness_of :correct, :scope => :problem_id, :if => "correct?"

    
  #TODO: add one_right_answer index
  
end



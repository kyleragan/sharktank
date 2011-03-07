


class Answer < ActiveRecord::Base
  attr_accessible :content, :correct
  
  belongs_to :problem, :inverse_of => :answers
  
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates_presence_of :problem
  validates_inclusion_of :correct, :in => [ true, false ]
  validates_uniqueness_of :content, :scope => :problem_id
  validates_uniqueness_of :correct, :scope => :problem_id, :if => "correct?"

    
  #TODO: add one_right_answer index
  
end



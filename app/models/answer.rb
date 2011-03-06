


class Answer < ActiveRecord::Base
  attr_accessible :content, :correct
  
  belongs_to :problem
  
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates :problem_id, :presence => true
  validates_inclusion_of :correct, :in => [ true, false ]

  validate :unique_answer_per_problem
  validate :one_right_answer_per_problem
  
  #OPTIMIZE: not sure how fast these validations are
  
  def unique_answer_per_problem
    if Answer.find(:first, :conditions => { :problem_id => self.problem_id, :content => self.content })
      errors.add(:content, "already exits for this problem")
    end
  end
  
  def one_right_answer_per_problem
    if self.correct && Answer.find(:first, :conditions => { :problem_id => self.problem_id, :correct => true })
      errors.add(:correct, "there is already a right answer for this problem")
    end
  end
  
  
  #TODO: add one_right_answer index
  
end



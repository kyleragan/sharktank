class Problem < ActiveRecord::Base
	
	attr_accessible :question, :answer
	
	validates :question,	:presence => true,
												:uniqueness => true 
	
	validates :answer,		:presence  => true
	
	def tex_question
	  return "$$"+question+"$$"
	end
	
	def tex_inline_question
	  return "\\("+question+"\\)"
  end
  
	def self.factory(t, params)
	  t ||= 'Problem'
	  class_name = t
	  if defined? class_name.constantize
	    return class_name.constantize.new(params)
    else
      Problem.new(params)
    end
	end
  
  def problem_type=(value)
    self[:type] = value
  end
  
  def problem_type
    return self[:type]
  end
  
	def generate
		a = rand(20)
		b = rand(20)
		c = a+b
		self.question = "#{a}+#{b}=?"
		self.answer = c.to_s
		return self
	end
	

	
end


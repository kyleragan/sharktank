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
 
	
	private
	
	def self.new_random_problem
		p = Problem.new
		a = rand(20)
		b = rand(20)
		c = a+b
		p.question = "#{a}+#{b}=?"
		p.answer = c.to_s
		return p
	end
	

	
end


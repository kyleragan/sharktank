class Problem < ActiveRecord::Base
	
	attr_accessible :question, :answer
	
	validates :question,	:presence => true,
												:uniqueness => true 
	
	validates :answer,		:presence  => true
	
	
	private
	
	def self.new_random_problem
		p = Problem.new
		p.question = "1+1=?"
		p.answer = "2"
		return p
	end
	
end

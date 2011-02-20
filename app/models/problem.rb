class Problem < ActiveRecord::Base
	
	attr_accessible :question, :answer
	
	validates :question,	:presence => true,
												:uniqueness => true 
	
	validates :answer,		:presence  => true
	
end

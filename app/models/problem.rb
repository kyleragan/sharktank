class Problem < ActiveRecord::Base
	
	attr_accessible :question, :answer
	
	validates :question, :presence => true
	
	validates :answer, :presence  => true
	
end

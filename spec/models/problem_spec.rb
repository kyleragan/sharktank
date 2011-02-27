require 'spec_helper'

describe Problem do
	
	before(:each) do
		@attr = { :question => "1+1=?", :answer => "42", } 
	end
	
	it "should create a new problem given valid attributes" do
		Problem.create!(@attr)
	end
	
	it "should require a question" do
		no_q_prob = Problem.new(@attr.merge(:question => ""))
		no_q_prob.should_not be_valid
	end
	
	it "should require an answer" do
		no_a_prob = Problem.new(@attr.merge(:answer => ""))
		no_a_prob.should_not be_valid
	end
	
	it "should reject duplicate questions" do
		Problem.create!(@attr)
		dup_prob = Problem.new(@attr)
		dup_prob.should_not be_valid
	end
	
	#TODO: add a problem uniquness index to the db.
	
	
end


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
	
	it "should not save without a question" do
	  no_q_prob = Problem.new(@attr.merge(:question => ""))
	  lambda do
	    no_q_prob.save
	  end.should_not change(Problem, :count)
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
	
	it "should not have a problem_type" do
	  p = Problem.create!(@attr)
	  p.problem_type.should be_nil
	end
	
	it "should have a model name 'Problem'" do
	  Problem.model_name.should == "Problem"
	end
	
	describe "factory method with nil type" do
	  before(:each) do
	    @p = Problem.factory(nil, @attr)
	  end
	  it "should create a 'Problem' class" do
	    @p.class.to_s.should == "Problem"
	  end
	  it "should have the right type" do
	    @p.problem_type.should be_nil
	  end
	end

	describe "factory method with 'Problem' type" do
	  before(:each) do
	    @p = Problem.factory("Problem", @attr)
	  end
	  it "should create a 'Problem' class" do
	    @p.class.to_s.should == "Problem"
	  end
	  it "should have the right type" do
	    @p.problem_type.should be_nil
	  end
	end
	
end


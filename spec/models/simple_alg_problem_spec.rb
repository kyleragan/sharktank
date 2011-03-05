require 'spec_helper'

describe SimpleAlgProblem do
	
	before(:each) do
		@attr = { :question => "12x+10=178" } 
	end
	
	it "should create a new problem given valid attributes" do
		SimpleAlgProblem.create!(@attr)
	end
	
	it "should require a question" do
		no_q_prob = SimpleAlgProblem.new(@attr.merge(:question => ""))
		no_q_prob.should_not be_valid
	end
	
	it "should not save without a question" do
	  no_q_prob = SimpleAlgProblem.new(@attr.merge(:question => ""))
	  lambda do
	    no_q_prob.save
	  end.should_not change(SimpleAlgProblem, :count)
	end
	
	
	it "should reject duplicate questions" do
		SimpleAlgProblem.create!(@attr)
		dup_prob = SimpleAlgProblem.new(@attr)
		dup_prob.should_not be_valid
	end
	
	it "should have the right problem_type" do
	  p = SimpleAlgProblem.create!(@attr)
	  p.problem_type.should == 'SimpleAlgProblem'
	end
	
	it "should have a model name 'Problem'" do
	  SimpleAlgProblem.model_name.should == "Problem"
	end
	
	describe "factory method with 'SimpleAlgProblem' type" do
	  before(:each) do
	    @p = SimpleAlgProblem.factory("SimpleAlgProblem", @attr)
	  end
	  it "should create a 'SimpleAlgProblem' class" do
	    @p.class.to_s.should == "SimpleAlgProblem"
	  end
	  it "should have the right type" do
	    @p.problem_type.should == "SimpleAlgProblem"
	  end
	  it "should have model name 'Problem'" do
	    @p.class.model_name.should == "Problem"
	  end
	end

end

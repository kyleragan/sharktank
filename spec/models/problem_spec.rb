require 'spec_helper'

describe Problem do
	
	before(:each) do
		@attr = { :question => "1+1=?", :answers_attributes => [{ :content => "2", :correct => true }] } 

	end
	
	it "should create a new problem given valid attributes" do
		Problem.create!(@attr)
	end
	
	it "should require a question" do
		no_q_prob = Problem.new(@attr.merge(:question => ""))
		no_q_prob.should_not be_valid
	end
	
	it "should require a nonblank question" do
	  prob = Problem.new(@attr.merge(:question => "  "))
	  prob.should_not be_valid
	end
	
	it "should not save without a question" do
	  no_q_prob = Problem.new(@attr.merge(:question => ""))
	  lambda do
	    no_q_prob.save
	  end.should_not change(Problem, :count)
	end
	
	it "should require at least one answer" do
	  @attr.delete(:answers_attributes)
	  p = Problem.new(@attr)
	  p.should_not be_valid
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
	
	describe "answer associations" do
	  
	  before(:each) do
	    @prob = Problem.factory('Problem', @attr)#.generate
	    @prob.save!
	    @ans1 = @prob.answers.first
	    @ans2 = @prob.answers.build(:content => "3", :correct => false)
	  end
	  
	  it "should have an answers attribute" do
	    @prob.should respond_to(:answers)
	  end
	  
	  it "should have two answers" do
	    @prob.answers.length.should == 2
	  end
	  
	  it "should have the right answers" do
	    @prob.answers.should == [@ans1, @ans2]
	  end
	  
	  it "should destroy associated answers" do
	    @prob.destroy
	    [@ans1, @ans2].each do |ans|
	      Answer.find_by_id(ans.id).should be_nil
	    end
	  end
	  
	  
	end
	
end



#TODO: write tests for generate
#TODO: write tests for changing problem type => changing class








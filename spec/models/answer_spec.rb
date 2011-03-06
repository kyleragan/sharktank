require 'spec_helper'

describe Answer do
  
  before(:each) do
    @prob = Factory(:problem)
    @attr = { :content => "some answer", :correct => true, :problem_id => 1 }
  end
  
  describe "validations" do
    
    it "should require a problem id" do
      Answer.new(@attr).should_not be_valid
    end
    
    it "should require nonblank content" do
      @prob.answers.build(@attr.merge(:content => "  ")).should_not be_valid
    end
    
    it "should require true/false" do
      @prob.answers.build(@attr.merge(:correct => nil)).should_not be_valid
    end
    
    it "should reject long content" do
      @prob.answers.build(@attr.merge(:content => "a"*51)).should_not be_valid
    end
    
    it "should be unique on content/problem"
    
    it "should be unique on true/problem"
    
  end
  
  it "should create a new instance given valid attributes" do
    @prob.answers.create!(@attr)
  end
  
  it "should create a new instance with correct set to false" do
    @prob.answers.create!(@attr.merge(:correct => false))
  end
  
  describe "problem associations" do

    before(:each) do
      @ans = @prob.answers.create(@attr)
    end

    it "should have a problem attribute" do
      @ans.should respond_to(:problem)
    end

    it "should have the right associated problem" do
      @ans.problem_id.should == @prob.id
      @ans.problem.should == @prob
    end
  end
  
end

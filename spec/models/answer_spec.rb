require 'spec_helper'

describe Answer do
  
  before(:each) do
    @prob = Factory(:problem) #1+1=2
    @attr = { :content => "some answer", :correct => false, :problem_id => @prob }
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
    
    it "should be unique on content/problem" do
      @prob.answers.create!(@attr)
      dup_ans = @prob.answers.build(@attr)
      dup_ans.should_not be_valid
    end
    
    it "should not create duplicate answer content on the same problem" do
      @prob.answers.create(@attr)
      lambda do
        @prob.answers.create(@attr)
      end.should_not change(Answer, :count)
    end
    
    it "should be unique on true/problem" do
      @prob.answers.create!(@attr)
      dup_ans = @prob.answers.build(@attr.merge( :content => "a different answer", 
                                                  :correct => true ))
      dup_ans.should_not be_valid
    end
    
    it "should not create another correct answer on the same problem" do
      @prob.answers.create(@attr)
      lambda do
        @prob.answers.create(@attr.merge( :content => "a different answer", 
                                                  :correct => true ))
      end.should_not change(Answer, :count)
    end
    
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

require 'spec_helper'

describe ProblemsController do
	render_views
	
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should set @probs" 
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @problem = Factory(:problem)
    end
    
    it "should be successful" do
      get :show, :id => @problem
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @problem
      assigns(:prob).should == @problem
    end
    
  end
  
  describe "POST 'create'" do
    
    it "should create a new problem"
    
    it "should redirect to the show page"
    
  end
	

end


require 'spec_helper'

describe ProblemsController do
	render_views
	
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Problem List")
    end
    
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
  
  describe "GET 'new'" do
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "New Problem")
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "with a blank problem" do
      
      before(:each) do
        @attr = { :question => "", :answer => "" }
      end
      
      it "should not create a problem" 
      
      it "should have the right title"
      
      it "should render the new page"
      
      it "should have a flash"
      
    end
    
  end
	

end
















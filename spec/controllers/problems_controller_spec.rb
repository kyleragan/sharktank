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
        @attr = { :question => "" }
      end
      
      it "should not create a problem" do
        lambda do
          post :create, :problem => @attr
        end.should_not change(Problem, :count)
      end
      
      it "should have the right title" do
        post :create, :problem => @attr
        response.should have_selector("title", :content => "New Problem")
      end
      
      it "should render the new page" do
        post :create, :problem => @attr
        response.should render_template('new')
      end
      
      it "should have an error explaination" do
        post :create, :problem => @attr
        response.should have_selector("div#error_explanation")
      end
      
    end
  
  describe "success" do
    
    before(:each) do
      @attr = { :question => "1+1=?" }
    end
    
    it "should create a problem" do
      lambda do
        post :create, :problem => @attr
      end.should change(Problem, :count).by(1)
    end
    
    it "should render the problem index" do
      post :create, :problem => @attr
      response.should render_template('index')
    end
    
    it "should have a success message" do
      post :create, :problem => @attr
      flash[:success].should =~ /problem created/i
    end
    
  end
    
  end
	
	describe "DELETE 'destroy'" do
	  
	  before(:each) do
	    @prob = Factory(:problem)
	  end
	  
	  it "should destroy the problem" do
	    lambda do
	      delete :destroy, :id => @prob
	    end.should change(Problem, :count).by(-1)
	  end
	  
	  it "should redirect to the problem list" do
	    delete :destroy, :id => @prob
	    response.should redirect_to(problems_path)
	  end
	  
	end
	
	
end



#TODO: write tests for the 'type' param

#TODO: write RSpec integration tests










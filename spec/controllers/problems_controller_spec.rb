require 'spec_helper'

describe ProblemsController do
	render_views
	
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
	
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should be the right page" do
    	get 'new'
    	response.should have_selector("h1", :content => "New Problem"  )
    end
    
  end
	

end

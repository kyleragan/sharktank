require 'spec_helper'

describe ProblemsController do
	render_views
	
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should set @probs" 
    #TODO: it "should set @probs"
    
  end
  
  describe "POST 'create'" do
    
    it "should create a new problem"
    
    it "should redirect to the show page"
    
  end
	

end


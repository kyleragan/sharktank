require 'spec_helper'

describe PopquizController do
  render_views
  
  describe "index" do
    
    before :each do
      @p = Factory(:problem)
    end
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Pop Quiz!")
    end
    
    it "should have a problem" do
      get :index
      assigns(:prob).should_not be_nil
    end
    
  end
  
end

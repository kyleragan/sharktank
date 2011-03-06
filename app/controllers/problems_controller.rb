class ProblemsController < ApplicationController
  

  
  def index
  	@probs = Problem.all
  	@title = "Problem List"
  end

  def show
  	@prob = Problem.find(params[:id])
  	
  end
	
	def new
	  type = params[:generate]
	  type ||= 'Problem'
	  @newprob = Problem.factory(type,{})
	  @newprob.generate
	  @title = "New Problem"
	end
	
	
	def create
	  if params[:generate]
	    #generate and reload :new
	    type = params[:generate]
	    @newprob = Problem.factory(type,params[:problem])
	    @newprob.generate
	    @title = "New Problem"
	    render :new and return
    else
      #attempt to save
      type = params[:type]
      @newprob = Problem.factory(type,params[:problem])
      @probs = Problem.all
      if @newprob.save
        @probs << @newprob
        flash[:success] = "Problem Created."
		    render :action => :index
      else
        @title = "New Problem"
        render :new
      end
	  end
	end
	
  def destroy
    Problem.find(params[:id]).destroy
    flash[:success] = "Problem Deleted."
    redirect_to problems_path
  end
	
  
end








#IMPROVE: can i change the text of my generate buttons?










class ProblemsController < ApplicationController
  

  
  def index
  	@probs = Problem.all
  	@title = "Problem List"
  end

  def show
  	@prob = Problem.find(params[:id])
  	
  end
	
	def new
	  type = params[:generate] || 'Problem'
	  @newprob = Problem.factory(type,params[:problem]).generate
	  @title = "New Problem"
	end
	
	
	def create
	  if type = params[:generate]
	    #generate and reload :new
	    @newprob = Problem.factory(type,{}).generate
	    @title = "New Problem"
	    render :new and return
    else
      #attempt to save
      @newprob = Problem.factory(type,params[:problem])
      @probs = Problem.all
      if @newprob.save
        @probs << @newprob
        flash[:success] = "Problem Created."
		    redirect_to problems_path
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





#TODO: think i need to move the generate code into 'new'


#IMPROVE: can i change the text of my generate buttons?










class ProblemsController < ApplicationController
  

  
  def index
  	@probs = Problem.all
  	@title = "Problem List"
  end

  def show
  	@prob = Problem.find(params[:id])
  	
  end
	
	def new
	  type = params[:type]
	  type ||= 'Problem'
	  @newprob = Problem.factory(type,{})
	  @newprob.generate
	  @title = "New Problem"
	end
	
	
	def create
	  if params[:type]
	    #generate and reload :new
	    type = params[:type]
	    @newprob = Problem.factory(type,params[type.underscore.to_sym])
	    @newprob.generate
	    @title = "New Problem"
	    render :new and return
    else
      #attempt to save
      type = params[type.underscore.to_sym][:type] if params[type.underscore.to_sym]
      @newprob = Problem.factory(type,params[type.underscore.to_sym])
      @probs = Problem.all
      if @newprob.save
        @probs << @newprob
        flash[:success] = "Problem Created."
		    render :index
      else
        render :new
      end
	  end
	end
	

	
	#TODO: edit, update, destroy
	#NOTE: probaly no edit/update controllers
  
end


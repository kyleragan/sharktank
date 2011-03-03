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
    type = params[:type]
	  type ||= 'Problem'
	  type ||= params[type.underscore.to_sym][:type]
	  @newprob = Problem.factory(type,params[type.underscore.to_sym])
	  @newprob.question = params[type.underscore.to_sym][:question]
	  @newprob.answer = params[type.underscore.to_sym][:answer]
    if params[:type]
      @newprob.generate
      @title = "New Problem"
      render :new and return
    end
    @probs = Problem.all
    
		if @newprob.save
		  @probs << @newprob
		  flash[:success] = "Problem Created."
		  render :index
		else
		  #TODO: handle failed problem create
		  #flash[:error] = "Error"
			render :new
		end
	end
	
	#TODO: edit, update, destroy
	#NOTE: probaly no edit/update controllers
  
end


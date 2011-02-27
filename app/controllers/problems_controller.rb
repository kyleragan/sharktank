class ProblemsController < ApplicationController
  
  def index
  	@probs = Problem.all
  	@newprob = Problem.new
  end

  def show
  	@prob = Problem.find(params[:id])
  	
  end
	
  
	def create
		@prob = Problem.new_random_problem
		if params[:simple_alg_problem]
		  @prob = SimpleAlgProblem.new_random_problem
    end
		if @prob.save
		  redirect_to index
#			redirect_to @prob
		else
		  #TODO: handle failed problem create
			render new
		end
	end
	
	#TODO: edit, update, destroy
	#NOTE: probaly no edit/update controllers
  
end


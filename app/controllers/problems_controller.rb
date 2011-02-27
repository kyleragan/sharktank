class ProblemsController < ApplicationController
  def index
  	@probs = Problem.all
  	@newprob = Problem.new
  end

  def show
  	@prob = Problem.find(params[:id])
  	
  end
	
#  def new
#  	@prob = Problem.new_random_problem if @prob.nil?
#  end
	
	
	#IMPROVE: This newalgebra method sucks. find a better way
  def newalgebra
  	@prob = SimpleAlgProblem.new_random_problem
  	render "new"
  end
  
	def create
		#@prob = Problem.new(params[:problem])
		@prob = Problem.new_random_problem
		@prob = SimpleAlgProblem.new_random_problem if params[:simple_algebra_problem]
		if @prob.save
		  redirect_to index
#			redirect_to @prob
		else
		  #TODO: handle failed problem create
			render new
		end
	end
	
	#TODO: edit, update, destroy
	
  
end


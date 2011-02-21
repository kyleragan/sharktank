class ProblemsController < ApplicationController
  def index
  	@probs = Problem.all
  end

  def show
  	@prob = Problem.find(params[:id])
  end
	
  def new
  	@prob = Problem.new_random_problem if @prob.nil?
  end
	
  def newalgebra
  	@prob = SimpleAlgProblem.new_random_problem
  	render "new"
  end
  
	def create
		@prob = Problem.new(params[:problem])
		if @prob.save!
			redirect_to @prob
		else
			render new
		end
	end
	
  
end

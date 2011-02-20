class ProblemsController < ApplicationController
  def index
  	
  end

  def show
  	@prob = Problem.find(params[:id])
  end

  def new
  	@prob = Problem.new
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

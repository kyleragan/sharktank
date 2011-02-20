class ProblemsController < ApplicationController
  def index
  	
  end

  def show
  	@prob = Problem.find(params[:id])
  end

  def new
  end

end

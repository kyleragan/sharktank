class PopquizController < ApplicationController
  def index
    @title = "Pop Quiz!"
    @prob = Problem.random
  end
end

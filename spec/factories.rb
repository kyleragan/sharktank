
Factory.define :problem do |prob|
	prob.question					"1+1"
	prob.answers_attributes [:content => "2", :correct => true]
end

Factory.define :answer do |ans|
  ans.content           "3"
  ans.correct           false
  
end


#IMPROVE: change the factories to use 'generate'

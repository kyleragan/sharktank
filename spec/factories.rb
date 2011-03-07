
Factory.define :problem do |prob|
	prob.question					"1+1"
end

Factory.define :answer do |ans|
  ans.content           "2"
  ans.correct           true
  ans.association       :problem
end


#IMPROVE: change the factories to use 'generate'

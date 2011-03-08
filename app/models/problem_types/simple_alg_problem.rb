class SimpleAlgProblem < Problem

	def generate
		a = 1+rand(15)
		x = rand(15)
		b = 1+rand(15)
		c = a*x+b
		self.question = "Solve for x: #{a}x + #{b} = #{c}"
		self.answers.clear
    self.answers.build(content: x.to_s, correct: true)
		return self
	end

end

#TODO: get autotest working for problem types


class SimpleAlgProblem < Problem

	

	
	def generate
		a = 1+rand(15)
		x = rand(15)
		b = 1+rand(15)
		c = a*x+b
		self.question = "Solve for x: #{a}x + #{b} = #{c}"
		self.answer = x.to_s
		return self
	end

end


class SimpleAlgProblem < Problem
	
	private
	
	def self.new_random_problem
		a = 1+rand(15)
		x = rand(15)
		b = 1+rand(15)
		c = a*x+b
		p = SimpleAlgProblem.new
		p.question = "Solve for x: #{a}x + #{b} = #{c}"
		p.answer = x.to_s
		return p
	end

end


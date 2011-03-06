class Problem < ActiveRecord::Base
	
	attr_accessible :question
	
	validates :question,	:presence => true,
												:uniqueness => true 
	
	def tex_question
	  return "$$"+question+"$$"
	end
	
	def tex_inline_question
	  return "\\("+question+"\\)"
  end
  
  def self.inherited(child) #make all children have model_name = 'Problem'
    child.instance_eval do
      def model_name
        Problem.model_name
      end
    end
    super
  end
  
	def self.factory(t, params)
	  t ||= 'Problem'
	  class_name = t
	  if defined? class_name.constantize
	    return class_name.constantize.new(params)
    else
      Problem.new(params)
    end
	end
  
  def problem_type=(value) #access the problemtype with these methods rather than model_name
    self[:type] = value
  end
  
  def problem_type
    return self[:type]
  end
  
	def generate
		a = rand(20)
		b = rand(20)
		c = a+b
		self.question = "#{a}+#{b}=?"
		self.type = "Problem"
		return self
	end
	

	
end








#TODO: add a 'ProblemTypeCustom' subclass, text box changes change type to problemtypecustom











class Problem < ActiveRecord::Base
	
	attr_accessible :question, :answers_attributes
	
	has_many :answers, :inverse_of => :problem, :dependent => :destroy
	accepts_nested_attributes_for   :answers, :allow_destroy => true
  
	
	validates :question,	:presence => true,
												:uniqueness => true 
  validate :at_least_one_answer
	
	def at_least_one_answer
	  if self.answers.length < 1 || self.answers.all?{|ans| ans.marked_for_destruction?}
	    errors.add(:base, "A Problem must have at least one answer")
    end
	end
	
  @types_of_problems = [] 
	
  class << self
    
    attr_reader :types_of_problems
    
    def inherited(child) #make all children have model_name = 'Problem'
      Problem.types_of_problems << child
      child.instance_eval do
        attr_accessible :answers_attributes
        def model_name
          Problem.model_name
        end
      end
      super
    end
    
  	def factory(t, params)
  	  t ||= 'Problem'
  	  class_name = t
  	  if defined? class_name.constantize
  	    return class_name.constantize.new(params)
      else
        Problem.new(params)
      end
  	end
  	
	end
	
	
	#IMPROVE: add generate to factory method?
  
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
		self.answers.clear
		self.answers.build(content: c.to_s, correct: true)
		return self
	end
	
	
	def tex_question
	  return "$$"+question+"$$"
	end
	
	def tex_inline_question
	  return "\\("+question+"\\)"
  end
  
  
  def self.load_all_problem_types
    type_dir = Dir.new("./app/models/problem_types")
    type_dir.each do |file_name| 
      if file_name =~ /.*\.rb/
        require "problem_types/"+file_name
        name = file_name.sub(".rb","").camelize.constantize
        puts name.to_s+" loaded"
        raise "Undefined: #{name}" unless defined?(name)
      end
    end
  end
	
	load_all_problem_types
	#TODO: test autoload
	
end






#TODO: add a 'ProblemTypeCustom' subclass, text box changes change type to problemtypecustom









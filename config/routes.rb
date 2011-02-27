Sharktank::Application.routes.draw do
	
	
	resources :problems do
		collection do
			get 'newalgebra'
		end
	end
	
	resources :simple_alg_problems, :controller => :problems
	


	match '/about', :to => 'pages#about'
	match '/contact', :to => 'pages#contact'
	
	root :to => 'pages#home'
	

	
end

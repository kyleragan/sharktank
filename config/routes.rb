Sharktank::Application.routes.draw do
	
	
	resources :problems, :only => [:index, :show, :create]
	
	resources :simple_alg_problems, :controller => :problems
	


	match '/about', :to => 'pages#about'
	match '/contact', :to => 'pages#contact'
	
	root :to => 'pages#home'
	

	
end


Sharktank::Application.routes.draw do
	
	resources :problems do
		collection do
			get 'newalgebra'
		end
	end
	


	match '/about', :to => 'pages#about'
	match '/contact', :to => 'pages#contact'
	
	root :to => 'pages#home'
	

	
end

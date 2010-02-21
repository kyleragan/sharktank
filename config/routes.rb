Sharktank::Application.routes.draw do
	
	resources :problems

	match '/about', :to => 'pages#about'
	match '/contact', :to => 'pages#contact'
	
	root :to => 'pages#home'
	

	
end

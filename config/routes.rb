Sharktank::Application.routes.draw do
	
	resources :problems do
		collection do
			get 'newalgebra'
		end
	end
	
	get "pages/home"

  get "pages/about"

  get "pages/contact"
  
end

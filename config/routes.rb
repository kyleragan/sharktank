Sharktank::Application.routes.draw do
	
	resources :problems
	
  get "pages/home"

  get "pages/about"

  get "pages/contact"
  
end

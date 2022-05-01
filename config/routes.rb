Rails.application.routes.draw do
	root to: "home#index"

	# Users
	get "/sign_up", to: "sign_up#new"
	post "/sign_up", to: "sign_up#create"
	get "/log_in", to: "sessions#new"
	post "/log_in", to: "sessions#create"
	delete "/log_out", to: "sessions#destroy"

	# Search
	get "/search", to: "search#index"

	# Filter
	get "/filter", to: "filter#index"

	# Current Location
	get "/current_location", to: "current_location#find"

	# Coffee Shop
	get "/coffee_shop", to: "coffee_shop#show"
	post "/favorite", to: "coffee_shop#favorite"
	delete "/favorite", to: "coffee_shop#destroy"

	# Google Oauth
	get "/auth/:provider/callback" => "sessions#omniauth"
end

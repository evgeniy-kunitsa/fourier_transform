Rails.application.routes.draw do
  root "home#index"
  get "/fourier" => "fourier#index"
  post "/fourier" => "fourier#show"

  get "/function_values" => "function_values#index"
  post "/function_values/show" => "function_values#show"

end

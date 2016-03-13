Rails.application.routes.draw do
  root "home#index"
  get "/fourier" => "fourier#index"
  post "/fourier" => "fourier#show"
end

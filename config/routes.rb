Rails.application.routes.draw do
  root to: redirect("/fourier")
  get "/fourier" => "fourier#index"
  post "/fourier" => "fourier#show"
end

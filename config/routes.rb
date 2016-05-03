Rails.application.routes.draw do
  root "home#index"

  get "/fourier" => "fourier#index"
  post "/fourier" => "fourier#show"

  get "/convolution_correlation" => "convolution_correlation#index"
  post "/convolution_correlation" => "convolution_correlation#show"

  get "/wavelet" => "wavelet#index"
  post "/wavelet" => "wavelet#show"
end

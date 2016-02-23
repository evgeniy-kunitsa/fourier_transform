Rails.application.routes.draw do
  root 'home#index'
  get '/fourier/:mode', to: 'fourier#index'
end

Rails.application.routes.draw do
  root 'home#index'
  get '/dft', to: 'home#discrete_fourier_transform'
  get '/fft', to: 'home#fast_fourier_transform'
end

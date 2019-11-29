Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :imc do
  	collection do
        match 'formulario', via: [:get, :post]
        match 'calcular', via: [:get, :post]
        match 'resultado', via: [:get, :post]
    end
  end
  root to: 'imc#index'
end

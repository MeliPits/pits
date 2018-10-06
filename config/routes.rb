Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # Devise routes for user management
  devise_for :usuarios, skip: :registrations
  devise_scope :usuario do
	resource :registration,
	only: [:new, :create, :edit, :update],
    path: 'usuarios',
    path_names: { new: 'sign_up' },
    controller: 'usuarios/registrations',
    as: :usuario_registration do
      get :cancel
    end
  end
  # Clients routes for clients management
  resources :clientes, only: [:index, :edit, :update]
  # Aseguradoras routes for aseguradoras management
  resources :aseguradoras, except: [:destroy]
  # Siniestro routes for siniestro management
  resources :siniestros, except: [:destroy]
end

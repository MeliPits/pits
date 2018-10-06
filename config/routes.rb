Rails.application.routes.draw do
  resources :autos
  resources :clientes
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
end

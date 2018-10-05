class ApplicationController < ActionController::Base
	before_action :login?

	def login?
    	if usuario_signed_in?
      		@c_user = current_usuario
    	end
	end

	def authenticate_user
    	redirect_to(new_usuario_session_path, alert: "Tienes que iniciar sesión") unless usuario_signed_in?
	end
end

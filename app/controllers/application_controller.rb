class ApplicationController < ActionController::Base
	before_action :login?

	def login?
    	if usuario_signed_in?
      		@c_user = current_usuario
      		if @c_user.token.nil?
      			@c_user.build_token.save
      		end
    	end
	end

	def authenticate_user
    	redirect_to(new_usuario_session_path, alert: "Tienes que iniciar sesión") unless usuario_signed_in?
	end

	def authenticate_super_admin!
		redirect_to root_path, alert: "No cuentas con los permisos necesarios para realizar esta operación" unless @c_user.admin?
	end 

	def authenticate_admin!
    	redirect_to root_path, alert: "No cuentas con los permisos necesarios para realizar esta operación" unless @c_user.admin? || @c_user.secretary?
  	end

	def authenticate_asesor!
		redirect_to root_path, alert: "No cuentas con los permisos necesarios para realizar esta operación" unless @c_user.asesor?
	end

	def error!(message,status)
	    @errors << message
	    response.status = status
	    render "api/v1/errors"
	end

	def set_errors
		@errors = []
	end
end

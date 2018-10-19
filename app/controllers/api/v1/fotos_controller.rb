class Api::V1::FotosController < ApplicationController
	before_action :set_errors
	before_action :validate_user
	before_action :set_siniestro

	def show
	end

	def create
		auto = @siniestro.auto
		@foto = auto.fotos_auto.where(tipo: params[:tipo]).take
		if @foto.nil?
			@foto = FotosAuto.new(fotos_params)
			@foto.auto = auto
			@foto.foto.attach(params[:foto])
			if @foto.save
				puts @foto.to_yaml
				render :show
			else
				error!("No se ha podido guardar la foto", :unauthorized)
				return
			end
		else
			error!("No se ha podido guardar la foto", :unauthorized)
			return
		end
	end

	def validate_user
		if(params.has_key?(:usuario) && params.has_key?(:token))
			@c_user = Usuario.find(params[:usuario])
			if @c_user.nil? || @c_user.token.nil?
				error!("No se ha iniciado sesión 3", :unauthorized)
				return
			end
			unless @c_user.token.token == params[:token]
				error!("No se ha iniciado sesión 2", :unauthorized)
				return
			end
		else
			error!("No se ha iniciado sesión 1", :not_found)
			return
		end
	end

	def set_siniestro
		if(params.has_key?(:siniestro) && params.has_key?(:tipo))
			@siniestro = Siniestro.find(params[:siniestro])
			if @siniestro.nil? || @siniestro.auto.nil?
				error!("Envia un siniestro valido", :not_found)
				return
			end
		else
			error!("Envia un siniestro valido", :not_found)
			return
		end
	end

	def fotos_params
		params.permit(:tipo)
	end
end
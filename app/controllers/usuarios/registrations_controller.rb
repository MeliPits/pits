# frozen_string_literal: true

class Usuarios::RegistrationsController < Devise::RegistrationsController
  
  skip_before_action :require_no_authentication
  before_action :authenticate_user
  before_action :authenticate_admin!, only: [:new, :create]

  # GET /resource/sign_up
  def new
    #raise params.to_yaml
    @usuario = Usuario.new
  end

  # POST /resource
  def create
    # raise params.to_yaml
    @contraseña_correo = params[:usuario][:password]
    @user = Usuario.new(create_usuario_params)
    if @user.save
      # ActionGMailMailer.bienvenido_email(@user,@contraseña_correo).deliver
      redirect_to root_path, notice: "Se ha creado el usuario"
    else
      render :new
    end
  end

  # GET /resource/edit
   def edit
    super
   end

  # PUT /resource
  def update
    super
  end

  # GET /resource/cancel
  def cancel
    super
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: "No cuentas con los permisos necesarios para realizar esta operación" unless @c_user.admin? || @c_user.secretary?
  end

  def create_usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation, :tipo, :nombreUsuario, :nombre, :celular)
  end
end

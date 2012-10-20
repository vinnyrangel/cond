# encoding: UTF-8

class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!
  
  def index
    
    if current_usuario.admin?
      redirect_to admin_index_url
    elsif current_usuario.morador? || current_usuario.sindico?
      if current_usuario.apartamento
        condominio = Condominio.find_by_id(current_usuario.apartamento.condominio_id).slug
        predio = Predio.find_by_id(current_usuario.apartamento.predio_id).slug

        path = condominio_predio_path(condominio, predio)
      end

      # se nao tiver associado[recem-cadastro] redirecionar para tela de associacao
      if current_usuario.apartamento.nil?
        path = cadastro_users_path
      end

      redirect_to path
    elsif current_usuario.anunciante?
      redirect_to anunciantes_users_url
    else
      render :text => "unknown user"
    end
  end

  def sem_lar
    render :text => "associar"
  end

  def show
    @user = Usuario.find(params[:id])
  end

  def new
    @user = Usuario.new
  end

  def edit
    @user = current_usuario
  end

  # POST /users
  # POST /users.json
  def create
    @user = Usuario.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = Usuario.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  # esse metodo serve para a verificação de leitura de avisos pelo usuário
  def leitura_aviso
    usuario = Usuario.find_by_id(params[:u])
    usuario.ultimo_aviso_visto = params[:a]
    usuario.save!

    render :text => 'ok'
  end
end

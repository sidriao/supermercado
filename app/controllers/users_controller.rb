class UsersController < ApplicationController

 before_filter :authenticate_user!

 load_and_authorize_resource

  def index
    @users = User.all
  end

  # GET /unidade_medidas/1
  # GET /unidade_medidas/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /unidade_medidas/new
  # GET /unidade_medidas/new.json
  def new

    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /unidade_medidas/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /unidade_medidas
  # POST /unidade_medidas.json
  def create

    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario foi criado com sucesso.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unidade_medidas/1
  # PUT /unidade_medidas/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user], :as => :admin)
        format.html { redirect_to @user, notice: 'Usuario foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidade_medidas/1
  # DELETE /unidade_medidas/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

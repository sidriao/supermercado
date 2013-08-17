class SupermercadosController < ApplicationController
  before_filter :authenticate_user!
  # GET /supermercados
  # GET /supermercados.json
  def index
    @supermercados = Supermercado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supermercados }
    end
  end

  # GET /supermercados/1
  # GET /supermercados/1.json
  def show
    @supermercado = Supermercado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supermercado }
    end
  end

  # GET /supermercados/new
  # GET /supermercados/new.json
  def new
    @supermercado = Supermercado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supermercado }
    end
  end

  # GET /supermercados/1/edit
  def edit
    @supermercado = Supermercado.find(params[:id])
  end

  # POST /supermercados
  # POST /supermercados.json
  def create
    @supermercado = Supermercado.new(params[:supermercado])

    respond_to do |format|
      if @supermercado.save
        format.html { redirect_to @supermercado, notice: 'Supermercado foi criado com sucesso' }
        format.json { render json: @supermercado, status: :created, location: @supermercado }
      else
        format.html { render action: "new" }
        format.json { render json: @supermercado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supermercados/1
  # PUT /supermercados/1.json
  def update
    @supermercado = Supermercado.find(params[:id])

    respond_to do |format|
      if @supermercado.update_attributes(params[:supermercado])
        format.html { redirect_to @supermercado, notice: 'Supermercado foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supermercado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supermercados/1
  # DELETE /supermercados/1.json
  def destroy
    @supermercado = Supermercado.find(params[:id])
    @supermercado.destroy

    respond_to do |format|
      format.html { redirect_to supermercados_url }
      format.json { head :no_content }
    end
  end
end

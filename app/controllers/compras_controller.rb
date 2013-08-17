class ComprasController < ApplicationController

  before_filter :authenticate_user!

  autocomplete :supermercado, :nome,  :full => true

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.order("data Desc").paginate :page => params['page'], :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compras }
    end
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
    @compra = Compra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compra }
    end
  end

  # GET /compras/new
  # GET /compras/new.json
  def new
    @compra = Compra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compra }
    end
  end

  # GET /compras/1/edit
  def edit
    @compra = Compra.find(params[:id])
    $compra = @compra
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(params[:compra])
    @compra.total = 0
    respond_to do |format|
      if @compra.save
        $compra = @compra
        flash[:notice] = 'Compra criada com sucesso.'
        format.html { redirect_to :controller => :item_compras, :action => :new }
        format.json { render json: @compra, status: :created, location: @compra }
      else
        format.html { render action: "new" }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compras/1
  # PUT /compras/1.json
  def update
    @compra = Compra.find(params[:id])

    respond_to do |format|
      if @compra.update_attributes(params[:compra])
        format.html { redirect_to @compra, notice: 'Compra atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra = Compra.find(params[:id])
    @compra.destroy

    respond_to do |format|
      format.html { redirect_to compras_url }
      format.json { head :no_content }
    end
  end
end

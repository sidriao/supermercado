class ItemComprasController < ApplicationController
  before_filter :authenticate_user!
  
  autocomplete :produto, :nome, :full => true

  def adiciona_produto
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to action: "new" }
        format.json { render json: @produto, status: :created, location: @produto }
      else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /item_compras.json
  def index
    @item_compras = ItemCompra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_compras }
    end
  end

  # GET /item_compras/1
  # GET /item_compras/1.json
  def show
    @item_compra = ItemCompra.find(params[:id])
    $compra = @item_compra.compra
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_compra }
    end
  end

  # GET /item_compras/new
  # GET /item_compras/new.json
  def new
    @item_compra = ItemCompra.new
    @item_compra.compra = $compra

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_compra }
    end
  end

  # GET /item_compras/1/edit
  def edit
    @item_compra = ItemCompra.find(params[:id])
  end

  # POST /item_compras
  # POST /item_compras.json
  def create
    @item_compra = ItemCompra.new(params[:item_compra])

    respond_to do |format|
      if @item_compra.save
        $compra = @item_compra.compra
        flash[:notice] = 'Item compra criado com Sucesso.'
        format.html { redirect_to action: "new" }
        format.json { render json: @item_compra, status: :created, location: @item_compra }
      else
        format.html { render action: "new" }
        format.json { render json: @item_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_compras/1
  # PUT /item_compras/1.json
  def update
    @item_compra = ItemCompra.find(params[:id])

    respond_to do |format|
      if @item_compra.update_attributes(params[:item_compra])
        format.html { redirect_to @item_compra, notice: 'Item Atualizado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_compras/1
  # DELETE /item_compras/1.json
  def destroy
    @item_compra = ItemCompra.find(params[:id])
    $compra = @item_compra.compra
    @item_compra.destroy

    respond_to do |format|
      format.html { redirect_to action: "new" }
      format.json { head :no_content }
    end
  end
end


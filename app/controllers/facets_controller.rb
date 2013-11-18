class FacetsController < ApplicationController
  before_action :set_facet, only: [:show, :edit, :update, :destroy]

  # GET /facets
  # GET /facets.json
  def index
    @facets = Facet.all
  end

  # GET /facets/1
  # GET /facets/1.json
  def show
  end

  # GET /facets/new
  def new
    @facet = Facet.new
  end

  # GET /facets/1/edit
  def edit
  end

  # POST /facets
  # POST /facets.json
  def create
    @facet = Facet.new(facet_params)

    respond_to do |format|
      if @facet.save
        format.html { redirect_to @facet, notice: 'Facet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @facet }
      else
        format.html { render action: 'new' }
        format.json { render json: @facet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facets/1
  # PATCH/PUT /facets/1.json
  def update
    respond_to do |format|
      if @facet.update(facet_params)
        format.html { redirect_to @facet, notice: 'Facet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @facet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facets/1
  # DELETE /facets/1.json
  def destroy
    @facet.destroy
    respond_to do |format|
      format.html { redirect_to facets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facet
      @facet = Facet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facet_params
      params.require(:facet).permit(:name)
    end
end

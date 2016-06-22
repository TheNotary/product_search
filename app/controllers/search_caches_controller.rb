class SearchCachesController < ApplicationController
  before_action :set_search_cach, only: [:show, :edit, :update, :destroy]

  # GET /search_caches
  # GET /search_caches.json
  def index
    @search_caches = SearchCache.all
  end

  # GET /search_caches/1
  # GET /search_caches/1.json
  def show
  end

  # GET /search_caches/new
  def new
    @search_cach = SearchCache.new
  end

  # GET /search_caches/1/edit
  def edit
  end

  # POST /search_caches
  # POST /search_caches.json
  def create
    @search_cach = SearchCache.new(search_cach_params)

    respond_to do |format|
      if @search_cach.save
        format.html { redirect_to @search_cach, notice: 'Search cache was successfully created.' }
        format.json { render :show, status: :created, location: @search_cach }
      else
        format.html { render :new }
        format.json { render json: @search_cach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_caches/1
  # PATCH/PUT /search_caches/1.json
  def update
    respond_to do |format|
      if @search_cach.update(search_cach_params)
        format.html { redirect_to @search_cach, notice: 'Search cache was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_cach }
      else
        format.html { render :edit }
        format.json { render json: @search_cach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_caches/1
  # DELETE /search_caches/1.json
  def destroy
    @search_cach.destroy
    respond_to do |format|
      format.html { redirect_to search_caches_url, notice: 'Search cache was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_cach
      @search_cach = SearchCache.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_cach_params
      params.require(:search_cach).permit(:query, :response)
    end
end

class HasCategoriesController < ApplicationController
  before_action :set_has_category, only: [:show, :edit, :update, :destroy]

  # GET /has_categories
  # GET /has_categories.json
  def index
    @has_categories = HasCategory.all
    @has_categories =  HasCategory.joins(:photo)
  end

  # GET /has_categories/1
  # GET /has_categories/1.json
  def show
    @has_categories = HasCategory.find(params[:id])
    @has_categories =  HasCategory.joins(:photo)
  end

  # GET /has_categories/new
  def new
    @has_category = HasCategory.new
  end

  # GET /has_categories/1/edit
  def edit
  end

  # POST /has_categories
  # POST /has_categories.json
  def create
    @has_category = HasCategory.new(has_category_params)

    respond_to do |format|
      if @has_category.save
        format.html { redirect_to @has_category, notice: 'Has category was successfully created.' }
        format.json { render :show, status: :created, location: @has_category }
      else
        format.html { render :new }
        format.json { render json: @has_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /has_categories/1
  # PATCH/PUT /has_categories/1.json
  def update
    respond_to do |format|
      if @has_category.update(has_category_params)
        format.html { redirect_to @has_category, notice: 'Has category was successfully updated.' }
        format.json { render :show, status: :ok, location: @has_category }
      else
        format.html { render :edit }
        format.json { render json: @has_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /has_categories/1
  # DELETE /has_categories/1.json
  def destroy
    @has_category.destroy
    respond_to do |format|
      format.html { redirect_to has_categories_url, notice: 'Has category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_has_category
      @has_category = HasCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def has_category_params
      params.fetch(:has_category, {})
    end
end

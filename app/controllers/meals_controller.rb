class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update]

  # GET /meals
  # GET /meals.json
  def index
    @day = params[:day].try {|str| Date.parse(str) } || Date.today
    @meals = Meal.where(eaten_on: @day)
  end

  # GET /meals/new
  def new
    @meal = Meal.new()
    @meal.eaten_on = params[:eaten_on]
    @meal.moment = params[:moment]
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to meals_path(day: @meal.eaten_on), notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to  meals_path(day: @meal.eaten_on), notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:eaten_on, :content, :moment)
    end
end

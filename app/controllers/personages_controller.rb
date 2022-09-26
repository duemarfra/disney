class PersonagesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    pp params[:movie_id]
    @movies = Movie.all
    @personages = Personage.all
    if params[:movie_id]
      @personages = @personages.where(movie_id: params[:movie_id])
    end
    if params[:min_age].present?
      @personages = @personages.where("age >= ?", params[:min_age])
    end
    if params[:max_age].present?
      @personages = @personages.where("age <= ?", params[:max_age])
    end
    if params[:name]
      @personages = Personage.where(name: params[:name])
    end
  end

  def show
    @personage = Personage.find(params[:id])
  end

  def new
    @personage = Personage.new
  end

  def create
    @personage = Personage.new(personage_params)
    if @personage.save
      redirect_to @personage
    else
      render :new
    end
  end

  def edit
    @personage = Personage.find(params[:id])
  end

  def update
    @personage = Personage.find(params[:id])
    if @personage.update(personage_params)
      redirect_to @personage
    else
      render :edit
    end
  end

  private

  def personage_params
    params.require(:personage).permit(:name, :age, :weight, :history, :movie_id, :photo)
  end
end

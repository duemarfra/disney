class MoviesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    pp params[:genre_id]
    @genres = Genre.all
    @movies = Movie.all

    if params[:genre_id]
      @movies = @movies.where(genre_id: params[:genre_id])
    end
    if params[:title]
      @movies = @movies.where(title: params[:title])
    end
    if params[:order] == "asc"
      @movies = Movie.order(creation_date: :asc)
    elsif params[:order] == "desc"
      @movies = Movie.order(creation_date: :desc)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :creation_date, :score, :genre_id, :photo)
  end
end

class Personage < ApplicationRecord
  has_one_attached :photo
  belongs_to :movie

  def movies
    movies = Movie.all

    movies.map { |movie|
      movies = []
      movies << movie.title
      movies << movie.id
    }
  end

  def movie_name(id)
    movies = Movie.find(id)
    movie.title
  end
end

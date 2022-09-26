class Movie < ApplicationRecord
  has_one_attached :photo
  belongs_to :genre
  has_many :personages, dependent: :destroy

  def genres
    genres = Genre.all

    genres.map { |genre|
      genres = []
      genres << genre.name
      genres << genre.id
    }
  end

  def genre_name(id)
    genre = Genre.find(id)
    genre.name
  end
end

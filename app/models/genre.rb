class Genre < ApplicationRecord
  has_one_attached :photo
  has_many :movies, dependent: :destroy
end

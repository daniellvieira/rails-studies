class Post < ApplicationRecord
  searchkick

  has_one_attached :image
end
